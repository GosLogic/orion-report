# Capítulo V: Product Implementation, Validation & Deployment

<h2 id="51-testing-suites--general-patterns">5.1 Testing Suites & General Patterns</h2>
<p>En esta sección documentamos los patrones arquitectónicos aplicados en la implementación y las suites de pruebas (<em>testing suites</em>) configuradas en Orion para verificar, de forma sistemática y repetible, el cumplimiento de los atributos de calidad del sistema. Este enfoque articula pruebas automatizadas, aislamiento de dependencias y validación frente a requisitos funcionales explícitos. De este modo, garantizamos que la mantenibilidad del código, los controles de seguridad y la disponibilidad operativa del servicio queden respaldados por evidencia objetiva en el ciclo de desarrollo.</p>

<h3 id="511-backend-application-core-testing-suite">5.1.1 Backend Application Core Testing Suite</h3>
<p>El núcleo del backend de Orion se valida mediante un <em>test harness</em> que combina la verificación fina de componentes y la validación de comportamiento frente al <em>Product Backlog</em>.</p>

<h4 id="5111-unit-testing">Pruebas unitarias (Unit Testing)</h4>
<p>La lógica central del dominio, como los cálculos de ruteo en el DispatchService y las reglas de negocio, se comprueba mediante pruebas unitarias aisladas. Estas pruebas se ejecutan utilizando frameworks estándar del ecosistema elegido, como JUnit para Java/Spring Boot o Jest para Node.js. Para preservar el aislamiento y la velocidad de feedback, utilizamos <em>Mocks</em> e Inyección de Dependencias que sustituyen las conexiones externas, en particular el acceso a las bases de datos relacionales y de series temporales (PostgreSQL y TimescaleDB). Así, cada caso evalúa una unidad de código sin depender de la infraestructura externa.</p>

<h4 id="5112-integration-acceptance-bdd">Pruebas de integración y de aceptación (BDD)</h4>
<p>El vínculo entre el software entregado y las Historias de Usuario (<em>User Stories</em>) lo cubrimos mediante el enfoque Behavior-Driven Development (BDD). Utilizando el framework Cucumber y escenarios redactados en lenguaje Gherkin dentro de archivos .feature, expresamos el comportamiento esperado en un formato estructurado (Dado / Cuando / Entonces) comprensible tanto para el negocio como para el equipo técnico. Estos escenarios mapean de manera explícita los criterios de aceptación hacia pruebas automatizadas integradas en nuestro pipeline de CI/CD. Esto nos permite asegurar que ninguna funcionalidad clave sufra regresiones antes de su paso a producción.</p>

<h3 id="512-pattern-based-backend-applications">5.1.2 Pattern Based Backend Application(s)</h3>
<p>Hemos estructurado el interior de nuestros microservicios de Orion de manera uniforme, aplicando de forma consistente una arquitectura en capas basada en el patrón Controller-Service-Repository. Esta decisión nos permite separar claramente los límites de responsabilidad dentro de cada servicio, facilitar la evolución independiente de sus piezas y mantener una lectura predecible del código a medida que integramos nuevos casos de uso en la plataforma SaaS.</p>
<p>En la capa de presentación, el Controller expone las APIs RESTful, valida la sintaxis de las peticiones entrantes y delega el trabajo sin concentrar reglas de dominio. El Service actúa como el núcleo aplicativo: aquí reside toda la lógica de negocio (como la asignación de rutas o las validaciones de telemetría), de modo que los controladores permanecen delgados y enfocados puramente en HTTP. Por su parte, el Repository concentra el acceso a datos y abstrae los detalles de persistencia, interactuando con un modelo políglota donde PostgreSQL soporta el núcleo transaccional y TimescaleDB atiende las métricas de series temporales.</p>
<p>La orquestación entre estas tres capas se resuelve mediante el patrón de Inyección de Dependencias (<em>Dependency Injection</em>), el cual es central para cumplir con nuestro atributo de calidad de Testeabilidad. Al declarar dependencias explícitas y orientadas a interfaces, podemos inyectar <em>Mocks</em> de los repositorios durante las pruebas unitarias de los servicios. Esto nos permite validar reglas y flujos de negocio sin necesidad de levantar una base de datos real ni depender de la infraestructura externa.</p>

<h3 id="513-pattern-based-custom-software-library">5.1.3 Pattern Based Custom Software Library</h3>
<p>Para cumplir con el principio DRY (Don't Repeat Yourself) y centralizar la seguridad de la plataforma SaaS multi-tenant, hemos externalizado la lógica transversal en una librería personalizada o paquete común (Custom Software Library). Esta librería compartida es importada por todos nuestros microservicios y se encarga exclusivamente de la validación de firmas de tokens JWT y de la extracción segura del TenantId desde el contexto de la petición. De este modo, evitamos replicar código de seguridad en cada servicio y garantizamos que el aislamiento de datos se aplique de manera uniforme en toda la arquitectura.</p>

<h3 id="514-framework-pattern-driven-refactoring-report">5.1.4 Framework Pattern Driven Refactoring Report</h3>
<p>Durante la configuración inicial de la arquitectura, hemos refactorizado la base de código de los microservicios para alinearla estrictamente con los principios de Domain-Driven Design (DDD). Hemos reestructurado los paquetes internos de modo que los límites de contexto (Bounded Contexts), como la gestión de Telemetría, el Despacho de rutas y la Identidad, mantengan fronteras claras y alta cohesión. Esta refactorización previene el acoplamiento innecesario y prepara el sistema para que cada módulo pueda evolucionar y desplegarse de manera totalmente independiente.</p>

<h2 id="52-software-configuration-management">5.2 Software Configuration Management</h2>
<p>La Gestión de la Configuración del Software (<em>Software Configuration Management</em>, SCM) en Orion formaliza cómo definimos, versionamos y controlamos los artefactos que conforman una plataforma SaaS cloud-native orientada a telemetría de flotas. En esta sección describimos el entorno de desarrollo adoptado por el equipo, la política de gestión del código fuente sobre GitHub y las convenciones de estilo que mantienen la coherencia entre el frontend, el backend basado en Spring Boot y los escenarios de prueba en Gherkin.</p>

<h3 id="521-software-development-environment-configuration">5.2.1 Software Development Environment Configuration</h3>
<p>Para garantizar un ciclo de vida de desarrollo estandarizado y colaborativo, hemos definido el entorno de trabajo del equipo de ingeniería. A continuación se detallan las herramientas oficiales estructuradas por categoría, incluyendo su ruta de referencia (para plataformas SaaS) o ruta de descarga (para software local), cumpliendo con las exigencias de configuración del proyecto Orion.</p>

<p><strong>1. Project &amp; Requirements Management</strong></p>
<ul>
<li><strong>Trello:</strong> Plataforma SaaS utilizada como tablero ágil (Kanban) para visualizar y actualizar el estado de las tareas e Historias de Usuario durante los Sprints. Ruta de referencia: <a href="https://trello.com">https://trello.com</a>.</li>
<li><strong>GitHub (Projects &amp; Issues):</strong> Herramienta SaaS para la trazabilidad de los hitos del proyecto y el control colaborativo mediante Pull Requests. Ruta de referencia: <a href="https://github.com">https://github.com</a>.</li>
</ul>

<p><strong>2. Product Design &amp; Architecture</strong></p>
<ul>
<li><strong>Figma:</strong> Plataforma SaaS para el prototipado de alta fidelidad y el diseño de interfaces (UX/UI) de la aplicación web y móvil. Ruta de referencia: <a href="https://www.figma.com">https://www.figma.com</a>.</li>
<li><strong>UXPressia:</strong> Herramienta SaaS corporativa utilizada durante la fase de análisis para elaborar los User Personas, Empathy Maps y As-Is / To-Be Scenario Maps. Ruta de referencia: <a href="https://uxpressia.com">https://uxpressia.com</a>.</li>
<li><strong>Lucidchart y Structurizr:</strong> Plataformas utilizadas para la diagramación de bases de datos, flujos lógicos y las vistas arquitectónicas del modelo C4. Rutas de referencia: <a href="https://www.lucidchart.com">https://www.lucidchart.com</a> | <a href="https://structurizr.com">https://structurizr.com</a>.</li>
</ul>

<p><strong>3. Software Development (IDEs &amp; SDKs)</strong></p>
<ul>
<li><strong>IntelliJ IDEA:</strong> Entorno de Desarrollo Integrado (IDE) principal, instalado localmente por los desarrolladores de backend para construir los microservicios en Java y Spring Boot. Ruta de descarga: <a href="https://www.jetbrains.com/idea/download">https://www.jetbrains.com/idea/download</a>.</li>
<li><strong>WebStorm:</strong> IDE especializado instalado localmente para el desarrollo del ecosistema frontend web. Ruta de descarga: <a href="https://www.jetbrains.com/webstorm/download">https://www.jetbrains.com/webstorm/download</a>.</li>
<li><strong>Visual Studio Code / Android Studio:</strong> IDEs configurados localmente para el desarrollo multiplataforma de la aplicación móvil del conductor. Rutas de descarga: <a href="https://code.visualstudio.com">https://code.visualstudio.com</a> | <a href="https://developer.android.com/studio">https://developer.android.com/studio</a>.</li>
<li><strong>Flutter SDK:</strong> Kit de desarrollo de software instalado localmente para compilar y ejecutar la aplicación móvil nativa con enfoque offline-first. Ruta de descarga: <a href="https://flutter.dev/docs/get-started/install">https://flutter.dev/docs/get-started/install</a>.</li>
</ul>

<p><strong>4. Software Testing</strong></p>
<ul>
<li><strong>Postman:</strong> Cliente API instalado localmente para el diseño, depuración y ejecución de pruebas manuales y automatizadas sobre los endpoints RESTful de nuestros microservicios. Ruta de descarga: <a href="https://www.postman.com/downloads">https://www.postman.com/downloads</a>.</li>
<li><strong>Cucumber:</strong> Framework integrado en el entorno de desarrollo para ejecutar pruebas de integración y de aceptación bajo el enfoque Behavior-Driven Development (BDD) utilizando lenguaje Gherkin. Ruta de referencia: <a href="https://cucumber.io">https://cucumber.io</a>.</li>
</ul>

<p><strong>5. Software Deployment &amp; Version Control</strong></p>
<ul>
<li><strong>Git:</strong> Sistema de control de versiones distribuido instalado en cada estación de trabajo para el seguimiento de modificaciones en el código fuente local. Ruta de descarga: <a href="https://git-scm.com/downloads">https://git-scm.com/downloads</a>.</li>
<li><strong>Docker Desktop:</strong> Herramienta de contenedorización local utilizada para levantar la base de datos (PostgreSQL/TimescaleDB) y las dependencias de infraestructura sin contaminar el sistema operativo del desarrollador. Ruta de descarga: <a href="https://www.docker.com/products/docker-desktop">https://www.docker.com/products/docker-desktop</a>.</li>
<li><strong>Google Cloud Platform / AWS:</strong> Proveedor de infraestructura en la nube elegido para el despliegue final de los contenedores en producción, respetando la arquitectura Cloud-Native exigida por el proyecto. Ruta de referencia: <a href="https://cloud.google.com">https://cloud.google.com</a> | <a href="https://aws.amazon.com">https://aws.amazon.com</a>.</li>
</ul>

<p><strong>6. Software Documentation</strong></p>
<ul>
<li><strong>Swagger UI (OpenAPI):</strong> Herramienta integrada internamente en nuestros microservicios para autogenerar y visualizar la documentación interactiva de nuestras APIs. Ruta de referencia: <a href="https://swagger.io/tools/swagger-ui">https://swagger.io/tools/swagger-ui</a>.</li>
</ul>

<p><strong>7. Core Frameworks &amp; Infrastructure Services</strong></p>
<ul>
<li><strong>Apache ActiveMQ:</strong> Message Broker de código abierto implementado para encolar masivamente los eventos de telemetría bajo alta concurrencia, desacoplando la ingesta de coordenadas GPS del hilo transaccional principal. Ruta de descarga: <a href="https://activemq.apache.org">https://activemq.apache.org</a>.</li>
<li><strong>Spring Cloud Eureka:</strong> Servidor de Service Discovery configurado para que todos los microservicios del backend se registren y se descubran dinámicamente en tiempo de ejecución. Ruta de referencia: <a href="https://spring.io/projects/spring-cloud-netflix">https://spring.io/projects/spring-cloud-netflix</a>.</li>
<li><strong>Astro:</strong> Framework web de alto rendimiento seleccionado para el desarrollo del portal administrativo del Gestor de Flota (FleetManagerSPA). Ruta de referencia: <a href="https://astro.build">https://astro.build</a>.</li>
</ul>

<h3 id="522-source-code-management">5.2.2 Source Code Management</h3>
<p>Para el proyecto Orion hemos adoptado un flujo de trabajo estructurado sobre Git, utilizando GitHub como nuestra plataforma central de control de versiones y colaboración. Dado que nuestra arquitectura se basa en microservicios, manejamos un enfoque multi-repositorio donde cada contexto delimitado (como la gestión de Identidad, Flota, Despacho y Telemetría) cuenta con su propio repositorio oficial dentro de la organización del equipo.</p>

<h4 id="5221-branching-gitflow">Estrategia de ramificación (GitFlow)</h4>
<p>Implementamos rigurosamente GitFlow para organizar el trabajo en paralelo y asegurar la calidad del código. Las integraciones hacia la rama principal se realizan exclusivamente mediante Pull Requests (PR) sujetos a revisión por pares, lo cual reduce drásticamente el riesgo de regresiones. Nuestra estructura de ramas y sus convenciones de nomenclatura son las siguientes:</p>
<ul>
<li><strong>main:</strong> Contiene el código estable que refleja exactamente lo que se encuentra desplegado en producción.</li>
<li><strong>develop:</strong> Línea de trabajo principal donde se integran las funcionalidades terminadas de cada iteración (Sprint).</li>
<li><strong>feature/:</strong> Ramas efímeras creadas a partir de develop para desarrollar historias de usuario concretas. Siguen la convención feature/US&lt;ID&gt;-&lt;descripcion&gt; (por ejemplo: feature/US01-tenant-config).</li>
<li><strong>release/:</strong> Ramas de preparación para los pases a producción. Siguen la convención release/v&lt;Version&gt;.</li>
<li><strong>hotfix/:</strong> Ramas creadas directamente desde main para resolver incidentes críticos. Siguen la convención hotfix/v&lt;Version&gt;.</li>
</ul>

<h4 id="5222-versioning-commits">Versionado y commits</h4>
<p>Para mantener una trazabilidad profesional en todos nuestros repositorios, aplicamos la especificación Semantic Versioning 2.0.0 (MAJOR.MINOR.PATCH) al momento de etiquetar nuestras versiones de despliegue. Asimismo, el historial de cambios se mantiene limpio y estructurado adoptando el estándar Conventional Commits. Es una regla innegociable que cada mensaje de commit inicie con un prefijo estructural (como feat:, fix:, test:, docs:) seguido de una descripción clara.</p>

<h4 id="5223-official-links">Enlaces oficiales del proyecto</h4>
<p>A continuación detallamos el acceso a nuestro espacio de trabajo centralizado. Mientras los repositorios se mantengan privados por políticas académicas y de protección de código, se garantiza que los miembros del jurado y docentes cuentan con el alcance de acceso necesario para auditar la evidencia de commits adjunta en este informe.</p>
<table>
<thead>
<tr><th>Componente / Módulo</th><th>Enlace del repositorio (GitHub)</th></tr>
</thead>
<tbody>
<tr><td>Organización general (Orion)</td><td>[Insertar enlace de la organización de GitHub aquí]</td></tr>
<tr><td>IAM Service (Backend)</td><td>[Insertar enlace del repo aquí]</td></tr>
<tr><td>Fleet Service (Backend)</td><td>[Insertar enlace del repo aquí]</td></tr>
<tr><td>Dispatch Service (Backend)</td><td>[Insertar enlace del repo aquí]</td></tr>
<tr><td>Telemetry Service (Backend)</td><td>[Insertar enlace del repo aquí]</td></tr>
<tr><td>Mobile App (Flutter)</td><td>[Insertar enlace del repo aquí]</td></tr>
<tr><td>FleetManager SPA (Web)</td><td>[Insertar enlace del repo aquí]</td></tr>
</tbody>
</table>

<h3 id="523-source-code-style-guide--conventions">5.2.3 Source Code Style Guide & Conventions</h3>
<p>Para asegurar la mantenibilidad a largo plazo y la coherencia técnica del proyecto Orion, hemos establecido como regla innegociable que todo el código fuente, los identificadores (variables, clases, métodos) y los mensajes de los commits deben redactarse estrictamente en idioma inglés. Además, el equipo ha adoptado las siguientes guías de estilo y convenciones oficiales según la tecnología.</p>

<h4 id="5231-java-spring-backend">Java y Spring Boot (Backend)</h4>
<p>Nos apegamos a la <a href="https://google.github.io/styleguide/javaguide.html">Google Java Style Guide</a>. Respetamos la convención de estructurar los paquetes por capa y por Bounded Context (separando claramente la capa de API, la lógica de negocio y la persistencia). Utilizamos PascalCase para las clases e interfaces, y camelCase para variables y métodos. Además, es obligatorio extraer cualquier secreto o configuración sensible hacia variables de entorno, evitando incrustar credenciales en el repositorio.</p>

<h4 id="5232-astro-typescript-ui">Astro, TypeScript y UI (Frontend Web)</h4>
<p>Para el portal administrativo, aplicamos la <a href="https://google.github.io/styleguide/tsguide.html">Google TypeScript Style Guide</a>. Exigimos tipado estricto, el uso de camelCase para funciones y PascalCase para componentes, evitando identificadores genéricos que oculten la intención del dominio (como id en lugar de tenantId). A nivel de interfaz, priorizamos el uso de HTML semántico (header, nav, main, section) y encapsulamos el CSS de forma modular dentro de cada componente .astro utilizando nombres de clase autodescriptivos separados por guiones medios (por ejemplo, .fleet-summary-card).</p>

<h4 id="5233-flutter-dart-mobile">Flutter y Dart (Mobile App)</h4>
<p>Para la aplicación móvil del conductor, seguimos las convenciones oficiales de <a href="https://dart.dev/effective-dart">Effective Dart</a>. Organizamos el código separando estrictamente la lógica de estado, los servicios de persistencia local (SQLite para el enfoque offline-first) y la interfaz de usuario. Utilizamos snake_case para nombrar los archivos y carpetas, y PascalCase para los widgets, priorizando la inmutabilidad mediante constructores constantes (const) para optimizar el rendimiento del dispositivo.</p>

<h4 id="5234-gherkin-testing">Gherkin (Testing Suites)</h4>
<p>Para nuestras pruebas de integración, adoptamos las prácticas descritas en <em>Gherkin: Conventions for Readable Specifications</em> y la referencia del ecosistema Cucumber. Redactamos los escenarios BDD respetando estrictamente las palabras clave en inglés (Given, When, Then, And), con saltos de línea claros entre pasos. Las formulaciones deben estar alineadas semánticamente a las Historias de Usuario de Orion, garantizando que los criterios de aceptación permanezcan trazables y auditables frente a las pruebas automatizadas (<em>step definitions</em>). Referencia: <a href="https://cucumber.io/docs/gherkin/reference/">https://cucumber.io/docs/gherkin/reference/</a>.</p>

<h3 id="524-software-deployment-configuration">5.2.4 Software Deployment Configuration</h3>
<p><em>Contenido por desarrollar.</em></p>

<h2 id="53-microservices-implementation">5.3 Microservices Implementation</h2>
<p><em>Contenido por desarrollar.</em></p>

<h3 id="521-sprint-1">5.2.1 Sprint 1</h3>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5211-sprint-backlog-1">5.2.1.1 Sprint Backlog 1</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5212-development-evidence-for-sprint-review">5.2.1.2 Development Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5213-testing-suite-evidence-for-sprint-review">5.2.1.3 Testing Suite Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5214-execution-evidence-for-sprint-review">5.2.1.4 Execution Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5215-microservices-documentation-evidence-for-sprint-review">5.2.1.5 Microservices Documentation Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5216-software-deployment-evidence-for-sprint-review">5.2.1.6 Software Deployment Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5217-team-collaboration-insights-during-sprint">5.2.1.7 Team Collaboration Insights during Sprint</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5218-kanban-board">5.2.1.8 Kanban Board</h4>
<p><em>Contenido por desarrollar.</em></p>

<h3 id="522-sprint-2">5.2.2 Sprint 2</h3>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5221-sprint-backlog-2">5.2.2.1 Sprint Backlog 2</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5222-development-evidence-for-sprint-review">5.2.2.2 Development Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5223-testing-suite-evidence-for-sprint-review">5.2.2.3 Testing Suite Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5224-execution-evidence-for-sprint-review">5.2.2.4 Execution Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5225-microservices-documentation-evidence-for-sprint-review">5.2.2.5 Microservices Documentation Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5226-software-deployment-evidence-for-sprint-review">5.2.2.6 Software Deployment Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5227-team-collaboration-insights-during-sprint">5.2.2.7 Team Collaboration Insights during Sprint</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5228-kanban-board">5.2.2.8 Kanban Board</h4>
<p><em>Contenido por desarrollar.</em></p>

<h3 id="523-sprint-3">5.2.3 Sprint 3</h3>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5231-sprint-backlog-3">5.2.3.1 Sprint Backlog 3</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5232-development-evidence-for-sprint-review">5.2.3.2 Development Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5233-testing-suite-evidence-for-sprint-review">5.2.3.3 Testing Suite Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5234-execution-evidence-for-sprint-review">5.2.3.4 Execution Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5235-microservices-documentation-evidence-for-sprint-review">5.2.3.5 Microservices Documentation Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5236-software-deployment-evidence-for-sprint-review">5.2.3.6 Software Deployment Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5237-team-collaboration-insights-during-sprint">5.2.3.7 Team Collaboration Insights during Sprint</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5238-kanban-board">5.2.3.8 Kanban Board</h4>
<p><em>Contenido por desarrollar.</em></p>

<h3 id="524-sprint-4">5.2.4 Sprint 4</h3>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5241-sprint-backlog-4">5.2.4.1 Sprint Backlog 4</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5242-development-evidence-for-sprint-review">5.2.4.2 Development Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5243-testing-suite-evidence-for-sprint-review">5.2.4.3 Testing Suite Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5244-execution-evidence-for-sprint-review">5.2.4.4 Execution Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5245-microservices-documentation-evidence-for-sprint-review">5.2.4.5 Microservices Documentation Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5246-software-deployment-evidence-for-sprint-review">5.2.4.6 Software Deployment Evidence for Sprint Review</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5247-team-collaboration-insights-during-sprint">5.2.4.7 Team Collaboration Insights during Sprint</h4>
<p><em>Contenido por desarrollar.</em></p>

<h4 id="5248-kanban-board">5.2.4.8 Kanban Board</h4>
<p><em>Contenido por desarrollar.</em></p>

<h2 id="54-microservices-deployment">5.4 Microservices Deployment</h2>
<p><em>Contenido por desarrollar.</em></p>

<h3 id="531-cloud-architecture-diagram">5.3.1 Cloud Architecture Diagram</h3>
<p><em>Contenido por desarrollar.</em></p>

<h3 id="532-cloud-architecture-deployment-aws-microsoft-azure-or-google-cloud">5.3.2 Cloud Architecture Deployment (AWS, Microsoft Azure or Google Cloud)</h3>
<p><em>Contenido por desarrollar.</em></p>
