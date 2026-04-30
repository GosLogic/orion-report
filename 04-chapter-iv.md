# Capítulo IV: Product Architecture Design


<h2 id="41-desing-concepts-viewpoints--er-diagrams">4.1 Desing Concepts, ViewPoints & ER Diagrams</h2>

<p><em>Esta sección define las estructuras, elementos y relaciones fundamentales de la arquitectura de Orion
. Aplicando el método ADD v3, presentaremos nuestras decisiones de diseño a través de múltiples vistas (principios, patrones y diagramas), ya que un sistema complejo no puede representarse en una única perspectiva</em></p>

<h3 id="411-principles-statements">4.1.1 Principles Statements</h3>

1. **Aislamiento Lógico por Defecto (Seguridad Multi-Tenant)**
   - **Descripción:** Queda estrictamente prohibida la dependencia en el filtrado manual a nivel de código para la separación de datos. Toda operación de lectura/escritura debe inyectar implícitamente el `TenantId` desde el API Gateway hasta la capa de persistencia, apoyándose en políticas de base de datos como Row-Level Security (RLS).
   - **Justificación de Negocio:** Orion opera bajo un modelo SaaS donde conviven datos de empresas de transporte competidoras. Mitigar el riesgo de exposición transversal de la información es innegociable para mantener la confianza comercial y proteger el secreto industrial de los clientes.

2. **Aislamiento de Proveedores Externos (Interoperabilidad)**
   - **Descripción:** Las integraciones con servicios de terceros (específicamente proveedores cartográficos y APIs de Google Maps) deberán canalizarse obligatoriamente a través de un patrón de Capa Anticorrupción (Anti-Corruption Layer). Ningún microservicio core debe depender de los contratos de datos externos.
   - **Justificación de Negocio:** Protege a Orion frente a la evolución técnica o cambios en la estructura de precios de terceros. Encapsular la integración asegura que una futura migración a otro proveedor (ej. OpenStreetMap) no requiera reescribir la lógica central de despacho y ruteo.

3. **Diseño para el Fallo y Degradación Elegante (Resiliencia)**
   - **Descripción:** El sistema debe impedir activamente la propagación de fallas en cascada (Cascading Failures). Es imperativa la implementación de la táctica de Circuit Breaker en las llamadas a servicios externos. Si el mapa falla, el sistema cortará la petición y operará en modo degradado (retornando la última ubicación en caché).
   - **Justificación de Negocio:** La gestión de flotas exige continuidad operativa crítica. Cualquier caída de un servicio externo debe mitigarse internamente para que la vista del gestor de flota nunca colapse y la asignación de unidades no se detenga.

4. **Llamadas Asincrónicas sobre Sincrónicas para Alta Carga (Performance)**
   - **Descripción:** Queda restringido el uso de llamadas sincrónicas (bloqueantes) para la ingesta de telemetría vehicular. Toda recepción masiva de coordenadas GPS adoptará un patrón Event-Driven mediante un Message Broker (como Kafka o RabbitMQ), encolando los eventos para su procesamiento diferido.
   - **Justificación de Negocio:** Durante las horas punta, Orion recibirá cientos de coordenadas GPS simultáneas. Desacoplar la recepción del procesamiento absorbe los picos de carga, garantizando que los tableros de control de los gestores mantengan una latencia mínima sin saturar la base de datos transaccional.

5. **Persistencia Local como Estándar Móvil u "Offline-First" (Operatividad)**
   - **Descripción:** La aplicación móvil guardará todo evento logístico primariamente en un almacenamiento local ligero (ej. SQLite). La transmisión a la nube se delegará a procesos en segundo plano condicionados a la red, aplicando obligatoriamente tácticas de Retry con Backoff Exponencial.
   - **Justificación de Negocio:** Las rutas de transporte frecuentemente atraviesan zonas de nula conectividad. Este principio garantiza el 100% de la trazabilidad de la jornada del conductor y salvaguarda la vida útil de la batería del dispositivo al evitar intentos de conexión fallidos continuos.

<h3 id="412-approaches-statements-architectural-styles--patterns">4.1.2 Approaches Statements Architectural Styles & Patterns</h3>

<h4>4.1.2.1 Approaches Statements</h4>

<p>Aplicación de Domain-Driven Design (DDD). Para Orion, la aplicación disciplinada de Domain-Driven Design (DDD) es el enfoque obligatorio para articular la solución técnica con los objetivos del negocio logístico. Este enfoque no se utilizará como una simple colección de patrones, sino como el marco principal para modelar las complejidades de la gestión de flotas, ruteo y telemetría.</p>

<p><strong>Modelado Basado en el Dominio (Core Domain Focus):</strong> Construiremos modelos explícitos que reflejen los conceptos operativos del sector. Identificaremos y priorizaremos nuestro Core Domain (Despacho Operativo y Telemetría), separándolo de nuestros Generic Subdomains (Gestión de Identidad y Tenants). Cada concepto clave del negocio se traducirá en entidades, agregados y servicios de dominio que preservarán las invariantes operativas, asegurando que las decisiones críticas se tomen con una representación coherente de la realidad logística.</p>

<p><strong>Límites de Contexto Claros (Bounded Contexts):</strong> La definición de Bounded Contexts en Orion es estrictamente necesaria para evitar la contaminación semántica entre áreas que evolucionan a ritmos distintos. Establecemos límites explícitos tales como:</p>

<ul>
  <li><strong>Monitoreo GPS vs. Mantenimiento Preventivo:</strong> En el primero se modelan eventos de ubicación y alertas de geocercas, mientras que el segundo gestiona kilometraje acumulado y órdenes de trabajo. Una modificación en la regla de desgaste de neumáticos no afectará el flujo de alta latencia del GPS.</li>
  <li><strong>Despacho Operativo vs. Gestión de Tenants:</strong> Mantener el aislamiento multi-tenant separado de la asignación de conductores asegura que una evolución en la política de seguridad no rompa la lógica del ruteo diario.</li>
</ul>

<p><strong>Lenguaje Ubicuo (Ubiquitous Language):</strong> El uso de un lenguaje omnipresente es un requisito ineludible. Términos clave como Despacho, Telemetría, Tenant, Geocerca y Viaje mantendrán una definición única e indiscutible entre los stakeholders del negocio, los diagramas de arquitectura y el código fuente (clases, eventos, contratos API). Por ejemplo, el concepto de "Viaje" no será ambiguo: en todo el sistema representará "un trayecto asignado a un conductor y un activo vehicular, con inicio, fin y métricas de cumplimiento".</p>

<p>Este enfoque asegura que Orion construya una solución técnica con una base semántica común, reduciendo la fricción entre los equipos de desarrollo y las áreas de operación. La disciplina DDD permite que la complejidad del dominio logístico se traduzca en software coherente, mantenible y alineado con la visión del negocio.</p>

<h4>4.1.2.2 Architectural Styles & Patterns</h4>

<p>Orion adopta una arquitectura de <strong>Microservicios Cloud-Native</strong> como estilo arquitectónico principal. Este estilo es adecuado para la plataforma porque permite escalar de forma independiente los componentes críticos de monitoreo, despacho y mantenimiento, y soporta la operación de una plataforma SaaS multi-tenant con altos requisitos de disponibilidad y rendimiento.</p>

<p>La comunicación sincrónica entre servicios se implementa mediante un estilo <strong>RESTful API</strong>. Los contratos RESTful se utilizarán para las operaciones de gestión transaccional, consultas de estado y administración de recursos. Este enfoque facilita la integración con clientes web y móviles, y permite exponer endpoints claros para la administración de Tenants, usuarios, rutas y órdenes de trabajo.</p>

<p>Para la ingesta masiva de telemetría, Orion utiliza un estilo de <strong>Event-Driven Architecture</strong>. La recepción de coordenadas GPS y eventos de estado se realiza a través de una canalización basada en eventos que desacopla la captura de datos de su procesamiento posterior. Esto es clave para absorber picos de carga durante las horas punta y mantener la latencia baja en los paneles de control.</p>

<p>Los patrones de diseño arquitectónico se seleccionan para soportar explícitamente los drivers de disponibilidad, interoperabilidad, seguridad y operatividad.</p>

<ul>
  <li><strong>API Gateway Pattern:</strong> El API Gateway actúa como punto de entrada único para todas las solicitudes externas. En Orion, este patrón es responsable de enrutar peticiones, validar centralizadamente el `TenantId`, aplicar políticas de seguridad y administrar el versionado de API. Su uso es indispensable para asegurar el aislamiento multi-tenant y garantizar que solo se permita acceso a los datos del cliente autorizado.</li>
  <li><strong>Circuit Breaker Pattern:</strong> Se aplica en las llamadas a servicios externos, especialmente a los proveedores cartográficos y APIs de Google Maps. El Circuit Breaker evita que una dependencia externa caída genere fallas en cascada, protegiendo así la continuidad del servicio. En Orion, esto permite que cuando el proveedor de mapas deje de responder, la plataforma degrade su funcionalidad de forma controlada y siga operando con datos en caché.</li>
  <li><strong>Anti-Corruption Layer (ACL):</strong> Este patrón aísla a Orion de los cambios en los contratos y estructuras de datos de los proveedores de mapas y GPS. La ACL traduce las APIs externas a un modelo interno estable, evitando que variaciones en los servicios de terceros se propaguen al dominio central. Así se protege la lógica de despacho, ruteo y monitoreo de la volatilidad de los sistemas externos.</li>
</ul>

<p>El conjunto de estos estilos y patrones asegura que Orion sea una plataforma robusta y coherente con su modelo de negocio logístico. La arquitectura microservicios permite la escalabilidad y el aislamiento operacional, las APIs RESTful soportan la interacción administrativa y móvil, y la arquitectura basada en eventos resuelve la ingestión de telemetría de alto volumen. Los patrones clave garantizan la seguridad, la resiliencia y la interoperabilidad que exige una solución SaaS para flotas vehiculares.</p>

<h3 id="413-context-diagram">4.1.3 Context Diagram</h3>
<p><em>Contenido por desarrollar.</em></p>

<h3 id="414-approach-driven-viewpoints-diagrams">4.1.4 Approach driven ViewPoints Diagrams</h3>
<p><em>Contenido por desarrollar.</em></p>

<h3 id="415-relationalnon-relational-database-diagram">4.1.5 Relational/Non Relational Database Diagram</h3>
<p><em>Contenido por desarrollar.</em></p>

<h3 id="416-design-patterns">4.1.6 Design Patterns</h3>
<p><em>Contenido por desarrollar.</em></p>

<h3 id="417-tactics">4.1.7 Tactics</h3>
<p><em>Contenido por desarrollar.</em></p>

<h2 id="42-architectural-drivers">4.2 Architectural Drivers</h2>
<p><em>Contenido por desarrollar.</em></p>

<h2 id="418-design-purpose">4.1.8 Design Purpose</h2>
<p><em>Contenido por desarrollar.</em></p>

<h2 id="419-primary-functionality-primary-user-stories">4.1.9 Primary Functionality (Primary User Stories)</h2>
<p><em>Contenido por desarrollar.</em></p>

<h2 id="4110-quality-attribute-scenarios">4.1.10 Quality Attribute Scenarios</h2>
<p><em>Contenido por desarrollar.</em></p>

<h2 id="4111-constraints">4.1.11 Constraints</h2>
<p><em>Contenido por desarrollar.</em></p>

<h2 id="4112-architectural-concerns">4.1.12 Architectural Concerns</h2>
<p><em>Contenido por desarrollar.</em></p>

<h2 id="43-add-iterations">4.3 ADD Iterations</h2>
<p><em>Contenido por desarrollar.</em></p>

<h3 id="431-iteration-1-establishing-initial-system-structure">4.3.1 Iteration 1: Establishing Initial System Structure</h3>

<h4 id="4311-architectural-design-backlog-1">4.3.1.1 Architectural Design Backlog 1</h4>

<p>En esta primera iteración de ADD, se realiza una revisión exhaustiva de los inputs arquitectónicos para identificar y priorizar los drivers que guiarán el diseño inicial. La tabla siguiente consolida los drivers identificados, incluyendo su descripción, importancia para el negocio y dificultad arquitectónica. Esta priorización se basa en el impacto en la viabilidad del proyecto Orion como plataforma SaaS multi-tenant para gestión de flotas.</p>

<table border="1" style="border-collapse: collapse; width: 100%; font-size: 0.95rem;">
  <thead>
    <tr>
      <th style="padding: 0.5rem;">ID del Driver</th>
      <th style="padding: 0.5rem;">Descripción</th>
      <th style="padding: 0.5rem;">Importancia para el Negocio</th>
      <th style="padding: 0.5rem;">Dificultad Arquitectónica</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 0.5rem;">PF-1</td>
      <td style="padding: 0.5rem;">Gestión Multi-Tenant: Soporte para múltiples empresas clientes con aislamiento de datos.</td>
      <td style="padding: 0.5rem;">Alta</td>
      <td style="padding: 0.5rem;">Alta</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">PF-2</td>
      <td style="padding: 0.5rem;">Ingesta de Telemetría GPS masiva: Procesamiento de grandes volúmenes de datos de ubicación en tiempo real.</td>
      <td style="padding: 0.5rem;">Alta</td>
      <td style="padding: 0.5rem;">Alta</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">PF-3</td>
      <td style="padding: 0.5rem;">Monitoreo en Tiempo Real (App y Web): Visualización inmediata de posiciones y eventos en interfaces móviles y web.</td>
      <td style="padding: 0.5rem;">Alta</td>
      <td style="padding: 0.5rem;">Media</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">QA-1</td>
      <td style="padding: 0.5rem;">Seguridad: Aislamiento lógico estricto por TenantId para prevenir fugas de datos entre empresas.</td>
      <td style="padding: 0.5rem;">Alta</td>
      <td style="padding: 0.5rem;">Alta</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">QA-2</td>
      <td style="padding: 0.5rem;">Disponibilidad: Resiliencia con Circuit Breaker ante fallas de Google Maps para mantener operaciones críticas.</td>
      <td style="padding: 0.5rem;">Alta</td>
      <td style="padding: 0.5rem;">Media</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">QA-3</td>
      <td style="padding: 0.5rem;">Performance: Alta carga asíncrona para telemetría, manejando picos sin degradación.</td>
      <td style="padding: 0.5rem;">Alta</td>
      <td style="padding: 0.5rem;">Alta</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">QA-4</td>
      <td style="padding: 0.5rem;">Operatividad: App Móvil Offline-First para registro de eventos sin conectividad.</td>
      <td style="padding: 0.5rem;">Alta</td>
      <td style="padding: 0.5rem;">Media</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">CON-1</td>
      <td style="padding: 0.5rem;">Uso intensivo de API de Google Maps: Dependencia crítica de servicios cartográficos externos.</td>
      <td style="padding: 0.5rem;">Alta</td>
      <td style="padding: 0.5rem;">Alta</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">CON-2</td>
      <td style="padding: 0.5rem;">Conectividad móvil intermitente en carreteras: Limitaciones de red en zonas rurales.</td>
      <td style="padding: 0.5rem;">Alta</td>
      <td style="padding: 0.5rem;">Media</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">CON-3</td>
      <td style="padding: 0.5rem;">Restricción de privacidad comercial: Protección estricta de datos sensibles de ubicación.</td>
      <td style="padding: 0.5rem;">Alta</td>
      <td style="padding: 0.5rem;">Alta</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">CRN-1</td>
      <td style="padding: 0.5rem;">Establecer una estructura inicial de microservicios Cloud-Native: Definir la arquitectura base escalable.</td>
      <td style="padding: 0.5rem;">Alta</td>
      <td style="padding: 0.5rem;">Alta</td>
    </tr>
  </tbody>
</table>

<h4 id="4312-establish-iteration-goal-by-selecting-drivers">4.3.1.2 Establish Iteration Goal by Selecting Drivers</h4>

<p>En esta primera iteración de ADD, el objetivo principal es lograr el concern CRN-1, estableciendo la estructura general inicial del sistema Orion mediante una arquitectura de microservicios Cloud-Native. Para alcanzar este objetivo, la iteración se centrará en seleccionar y abordar los drivers críticos que fundamentan la viabilidad del proyecto, específicamente QA-1 (seguridad con aislamiento por TenantId), QA-3 (performance para alta carga asíncrona en telemetría), CON-1 (uso intensivo de APIs de Google Maps) y CON-2 (conectividad móvil intermitente). Estos drivers se priorizan por su impacto directo en la escalabilidad, seguridad y operatividad de la plataforma, permitiendo una base sólida para iteraciones futuras.</p>

<h4 id="4313-choose-one-or-more-elements-of-the-system-to-refine">4.3.1.3 Choose One or More Elements of the System to Refine</h4>

<p>Dado que Orion es un desarrollo Greenfield (creado desde cero), el elemento del sistema a refinar en esta primera iteración es "todo el sistema" (the entire system). Esta elección permite identificar y definir las aplicaciones de alto nivel, capas arquitectónicas y componentes principales, estableciendo una estructura base que soporte los drivers seleccionados sin asumir diseños previos.</p>

<h4 id="4314-choose-one-or-more-design-concepts-that-satisfy-the-selected-drivers">4.3.1.4 Choose One or More Design Concepts That Satisfy the Selected Drivers</h4>

<p>Para satisfacer los drivers seleccionados en esta iteración (QA-1 Seguridad, QA-3 Performance, CON-1 Uso intensivo de APIs de Google Maps, CON-2 Conectividad móvil intermitente y CRN-1 Estructura inicial de microservicios Cloud-Native), se evalúan tres conceptos de diseño arquitectónico alternativos. Cada opción se analiza en términos de pros y contras, considerando su alineación con los requerimientos de Orion como plataforma SaaS multi-tenant para gestión de flotas vehiculares.</p>

<table border="1" style="border-collapse: collapse; width: 100%; font-size: 0.95rem;">
  <thead>
    <tr>
      <th style="padding: 0.5rem;">Concepto de Diseño</th>
      <th style="padding: 0.5rem;">Pros</th>
      <th style="padding: 0.5rem;">Contras</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 0.5rem;"><strong>Opción 1: Arquitectura de Microservicios con API Gateway y Event-Driven</strong><br>Implementa servicios independientes desplegables en contenedores, con un API Gateway para enrutamiento y validación de TenantId, y un bus de eventos para telemetría asíncrona.</td>
      <td style="padding: 0.5rem;">- Alta escalabilidad y resiliencia para picos de telemetría (QA-3).<br>- Aislamiento nativo por TenantId en cada servicio (QA-1).<br>- Soporte nativo para Cloud-Native y degradación elegante ante fallas de APIs externas (CON-1).<br>- Facilita offline-first en móviles mediante sincronización diferida (CON-2).</td>
      <td style="padding: 0.5rem;">- Complejidad inicial en orquestación y monitoreo.<br>- Mayor overhead en comunicación inter-servicios.<br>- Requiere infraestructura avanzada (Kubernetes, etc.).</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;"><strong>Opción 2: Arquitectura Orientada a Servicios (SOA) con ESB</strong><br>Utiliza un Enterprise Service Bus (ESB) para mediación de servicios, con contratos WSDL para integración y orquestación centralizada.</td>
      <td style="padding: 0.5rem;">- Buena integración con APIs externas mediante transformación en ESB (CON-1).<br>- Soporte para aislamiento lógico mediante políticas en el bus.<br>- Escalabilidad moderada para cargas asíncronas.</td>
      <td style="padding: 0.5rem;">- Menos eficiente para alta concurrencia en telemetría (QA-3).<br>- Punto único de fallo en ESB, afectando disponibilidad.<br>- No optimizado para Cloud-Native ni offline-first (CON-2).<br>- Mayor latencia en comparación con microservicios.</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;"><strong>Opción 3: Arquitectura Monolítica Modular con CQRS</strong><br>Estructura monolítica dividida en módulos (e.g., Tenant, Telemetry), con CQRS para separar comandos (escritura) de queries (lectura) para optimizar performance.</td>
      <td style="padding: 0.5rem;">- Simplicidad de desarrollo inicial y despliegue.<br>- CQRS mejora performance en lecturas de telemetría (QA-3).<br>- Fácil aislamiento por TenantId en módulos.</td>
      <td style="padding: 0.5rem;">- Limitaciones en escalabilidad horizontal (no Cloud-Native).<br>- Dificultad para degradación ante fallas externas (CON-1).<br>- No soporta offline-first eficientemente (CON-2).<br>- Alto riesgo de acoplamiento y monolito grande.</td>
    </tr>
  </tbody>
</table>

<p>La opción seleccionada es la <strong>Arquitectura de Microservicios con API Gateway y Event-Driven</strong>. Esta elección se justifica por su alineación directa con CRN-1 (estructura Cloud-Native), su capacidad para manejar QA-1 y QA-3 de manera nativa, y su flexibilidad para integrar CON-1 y CON-2 sin comprometer la escalabilidad. Aunque introduce complejidad inicial, es la más óptima para un proyecto Greenfield como Orion, permitiendo evolución incremental y resiliencia en un entorno SaaS multi-tenant.</p>

<h4 id="4315-instantiate-architectural-elements-allocate-responsibilities-and-define-interfaces">4.3.1.5 Instantiate Architectural Elements, Allocate Responsibilities, and Define Interfaces</h4>

<p>Basado en los conceptos seleccionados (Arquitectura de Microservicios con API Gateway, Event-Driven y patrón Offline-First), se instancian los elementos arquitectónicos de software (Contenedores) para Orion. El diseño se estructura respetando los Bounded Contexts definidos por Domain-Driven Design (DDD), garantizando alta cohesión y bajo acoplamiento.</p>

<p><strong>Instanciación y Asignación de Responsabilidades:</strong></p>
<table border="1" style="border-collapse: collapse; width: 100%; font-size: 0.95rem;">
  <thead>
    <tr>
      <th style="padding: 0.5rem;">Elemento Arquitectónico</th>
      <th style="padding: 0.5rem;">Responsabilidades Principales</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 0.5rem;">Orion Mobile App (Frontend)</td>
      <td style="padding: 0.5rem;">- Permite al conductor registrar su jornada y reportar incidentes.<br>- Aplica patrón Offline-First con almacenamiento local (SQLite).<br>- Captura y transmite telemetría GPS aplicando Retry con Backoff.</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">Fleet Manager SPA (Frontend)</td>
      <td style="padding: 0.5rem;">- Portal web administrativo para la gestión logística de flotas.<br>- Consume APIs para visualización de mapas en tiempo real y reportes.</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">API Gateway (Routing/Security)</td>
      <td style="padding: 0.5rem;">- Punto de entrada único. Autentica mediante tokens JWT.<br>- Intercepta peticiones para inyectar implícitamente el TenantId.<br>- Aplica Rate Limiting para proteger contra sobrecargas.</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">Tenant Management Service (Microservicio)</td>
      <td style="padding: 0.5rem;">- Crea y configura perfiles de clientes (Tenants) con aislamiento lógico.<br>- Valida políticas de seguridad y roles sin depender de otros dominios.</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">Fleet & Dispatch Service (Microservicio)</td>
      <td style="padding: 0.5rem;">- Corazón logístico: Gestiona vehículos, conductores y asignación de rutas.<br>- Orquesta el mantenimiento preventivo basado en reglas de negocio.</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">Telemetry & Maps Service (Microservicio)</td>
      <td style="padding: 0.5rem;">- Consume el bus de eventos para procesar coordenadas GPS.<br>- Consulta APIs de Google Maps utilizando un Anti-Corruption Layer.<br>- Aplica Circuit Breaker y cachea resultados (Redis) para reducir costos.</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">Event Bus / Message Broker (Infraestructura)</td>
      <td style="padding: 0.5rem;">- Canal asíncrono (ej. Apache Kafka o RabbitMQ).<br>- Transporta la telemetría GPS masiva desacoplando a los productores (App) de los consumidores (Microservicios).</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">Core Relational DB (Persistencia)</td>
      <td style="padding: 0.5rem;">- Base de datos principal (ej. PostgreSQL) con esquema Multi-Tenant.<br>- Aplica políticas Row-Level Security (RLS) por TenantId.</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">Telemetry Time-Series DB (Persistencia)</td>
      <td style="padding: 0.5rem;">- Almacenamiento no relacional optimizado para alta velocidad de escritura (Logs históricos masivos de posiciones).</td>
    </tr>
  </tbody>
</table>

<p><strong>Definición de Interfaces de Comunicación:</strong></p>
<ul>
  <li><strong>API Gateway a Servicios Internos (Sincrónico):</strong> Interfaces RESTful documentadas con contratos OpenAPI (Swagger). Utilizan Data Transfer Objects (DTOs) para transferir datos estructurados, garantizando que el TenantId viaje de forma segura en las cabeceras.</li>
  <li><strong>App Móvil a Event Bus (Asincrónico):</strong> Protocolo de mensajería asíncrona para la telemetría utilizando formatos de serialización ligeros (como JSON o Avro) encapsulados en un evento TelemetryEvent (latitud, longitud, timestamp, vehicleId).</li>
  <li><strong>Telemetry & Maps Service a APIs Externas:</strong> Interfaces HTTP/HTTPS con autenticación de proveedor (Google Cloud), encapsuladas en un adaptador interno que traduce las respuestas de geocodificación al lenguaje ubicuo del dominio de Orion, logrando total interoperabilidad.</li>
</ul>

<h4 id="4316-sketch-views-c4--uml-and-record-design-decisions">4.3.1.6 Sketch Views (C4 & UML) and Record Design Decisions</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="4317-analysis-of-current-design-and-review-iteration-goal-kanban-board">4.3.1.7 Analysis of Current Design and Review Iteration Goal (Kanban Board)</h4>
<p><em>Contenido por desarrollar.</em></p>
