# Capítulo I: Introducción


<h2 id="11-startup-profile">1.1 Startup Profile</h2>

<p><em>Contenido por desarrollar.</em></p>

<h3 id="111-descripción-de-la-startup">1.1.1 Descripción de la Startup</h3>

<p><em>Contenido por desarrollar.</em></p>

<h3 id="112-perfiles-de-integrantes-del-equipo">1.1.2 Perfiles de integrantes del equipo</h3>

<table border="1">
  <tr>
      <td style="text-align:center;"><img alt="Angelo Solano" src="assets/chapter-i/FotoAngelo.png" /></td>
      <td><strong>Angelo Solano - u20231B775</strong><br>Mi nombre es Angelo Solano, soy estudiante de Ingeniería de Software en la UPC. Me apasiona la tecnología y todo lo relacionado con el desarrollo de software. Me gusta enfrentarme a desafíos complejos y encontrar soluciones creativas. Estoy en constante aprendizaje, siempre buscando mejorar mis habilidades en programación y análisis de sistemas. Me considero una persona comprometida con mis proyectos y con ganas de crecer tanto profesionalmente como personalmente. Disfruto trabajar en equipo y siempre trato de aportar lo mejor de mí en todo lo que hago.</td>
  </tr>
  <tr>
      <td style="text-align:center;"><img alt="Sergio Iglesias " src="assets/chapter-i/FotoSergio.png" /></td>
      <td><strong>Sergio Iglesias - u202316118</strong><br>Mi nombre es Sergio Iglesias, tengo 20 años y estoy cursando mi 7to ciclo de la carrera de Ingeniería de Software en la UPC. Soy una persona proactiva, creativa y con gran pasión por la tecnología. Me destaco por mi capacidad de resolver problemas de manera eficiente y mi habilidad para trabajar colaborativamente en proyectos complejos. Estoy comprometido con el aprendizaje continuo y siempre busco aplicar las mejores prácticas en el desarrollo de software. Mi objetivo es contribuir significativamente al éxito de este proyecto y crecer profesionalmente en el campo de la ingeniería de software.</td>
  </tr>
</table>

<h2 id="12-solution-profile">1.2 Solution Profile</h2>

<p><em>Contenido por desarrollar.</em></p>

<h3 id="121-nombre-del-producto">1.2.1 Nombre del producto</h3>

<p><em>Contenido por desarrollar.</em></p>

<h3 id="122-antecedentes-y-problemática">1.2.2 Antecedentes y problemática</h3>

<p><em>Contenido por desarrollar.</em></p>

<h3 id="123-lean-ux-process">1.2.3 Lean UX Process</h3>

<h4 id="1231-lean-ux-problem-statement">1.2.3.1 Lean UX Problem Statement</h4>

Nuestra solución busca proveer una plataforma SaaS multi-tenant que permita centralizar la gestión operativa y el ciclo de vida vehicular, integrando telemetría en tiempo real y mantenimiento preventivo.

Hemos observado que las empresas de transporte sufren altos costos operativos debido a fallas mecánicas imprevistas y la falta de visibilidad en tiempo real de sus vehículos, lo que repercute en la disponibilidad de sus activos.

¿Cómo podemos optimizar la gestión de mantenimiento y la visibilidad de la flota para reducir paradas no programadas?

Nuestra solución busca garantizar la privacidad y el aislamiento total de los datos mediante una arquitectura basada en TenantId, asegurando que la información sensible de una empresa sea inaccesible para sus competidores.

Hemos observado que las soluciones tradicionales no ofrecen un aislamiento seguro, lo que genera desconfianza y miedo a la fuga de información estratégica entre empresas del mismo sector.

¿Cómo puede nuestra arquitectura asegurar un aislamiento lógico total que brinde seguridad y confianza a cada cliente corporativo?

Nuestra solución busca proveer una herramienta móvil con enfoque offline-first para que los conductores registren eventos y telemetría sin interrupciones, independientemente de la cobertura de red.

Hemos observado que los conductores suelen transitar por zonas sin cobertura, lo que ocasiona la pérdida de registros críticos de jornada, ubicación y eventos de mantenimiento.

¿Cómo podemos garantizar que el registro de datos sea continuo y resiliente en zonas con conectividad intermitente?

<h4 id="1232-lean-ux-assumptions">1.2.3.2 Lean UX Assumptions</h4>

**Business Assumptions:**

- Creemos que nuestros usuarios necesitan un control estricto sobre el ciclo de vida de sus vehículos para evitar reparaciones correctivas costosas.
- Estas necesidades se pueden satisfacer con un motor de reglas preventivas basado en telemetría (KM y tiempo) y un panel de control centralizado.
- Nuestros clientes iniciales serán múltiples empresas de transporte de carga y logística en Perú que buscan optimizar su flota y gestionar personal de campo.
- El valor más importante que un cliente quiere de nuestros servicios es la garantía de privacidad (multi-tenancy) y la reducción de incidentes mecánicos en ruta.
- El cliente también va a obtener reportes de rendimiento por unidad, alertas automáticas y mayor vida útil de sus activos.
- Vamos a obtener la mayoría de los clientes mediante venta directa B2B, demostraciones técnicas de seguridad de datos y presencia en ferias de logística.
- Vamos a obtener ingresos mediante una suscripción mensual escalable basada en la cantidad de vehículos monitoreados.
- Nuestra competencia en el mercado serán sistemas de GPS básicos, hojas de cálculo manuales o software legacy sin capacidades predictivas ni de aislamiento seguro.
- Vamos a tener ventaja frente a nuestra competencia debido a la arquitectura segura por TenantId, la resiliencia offline de la app y la optimización de costos en telemetría (Google Maps).
- El mayor riesgo del servicio es una posible vulneración de seguridad o fuga de información entre tenants, lo que afectaría la confianza de las empresas clientes y la continuidad del negocio.
- Lo resolveremos implementando aislamiento lógico estricto por TenantId en toda la arquitectura, controles de acceso por roles, cifrado de datos en tránsito y en reposo, auditoría de accesos y pruebas periódicas de seguridad.

**User Assumptions:**

- **¿Quién es el usuario?** Los gestores de flota que toman decisiones estratégicas y los conductores que operan las unidades en campo bajo diversas condiciones de red.
- **¿Qué problemas tiene nuestro producto que resolver?** La incertidumbre sobre el estado mecánico de los vehículos, la falta de seguridad en plataformas compartidas y la pérdida de datos en zonas rurales o carreteras sin señal.
- **¿Qué características son importantes?** Aislamiento lógico de datos, alertas preventivas automáticas, visualización en mapas con bajo consumo de datos y una app móvil que funcione sin internet.
- **¿Dónde encaja nuestro producto en su trabajo o vida?** Se integra en la rutina diaria del conductor al iniciar jornada y en la gestión diaria del supervisor para monitorear indicadores de mantenimiento y ubicación.
- **¿Cuándo y cómo es nuestro producto usado?** Se usa en tiempo real durante el trayecto de los vehículos y para la planificación de ingresos a taller. Se accede vía web (gestores) y móvil (conductores).
- **¿Cómo debe verse nuestro producto y cómo debe comportarse?** Debe ser profesional, con dashboards de alto impacto visual para gestores, y una interfaz simplificada de alto contraste para conductores en ruta.

<h4 id="1233-lean-ux-hypothesis">1.2.3.3 Lean UX Hypothesis</h4>

**Hypothesis Statement 01**  
Creemos que implementando aislamiento lógico estricto por TenantId para todas las operaciones de la plataforma, sabremos que hemos tenido éxito cuando el 100% de las pruebas de acceso cruzado entre empresas sean bloqueadas y validadas en QA.

**Hypothesis Statement 02**  
Creemos que activando reglas de mantenimiento preventivo por kilometraje y tiempo (aceite, neumáticos y revisiones), sabremos que hemos tenido éxito cuando las fallas no programadas se reduzcan en al menos 30% durante los primeros seis meses.

**Hypothesis Statement 03**  
Creemos que centralizando en Orion la asignación de rutas, horarios, estado de unidades y alertas operativas, sabremos que hemos tenido éxito cuando el tiempo de planificación diaria del gestor se reduzca en 40%.

**Hypothesis Statement 04**  
Creemos que ofreciendo una capacitación guiada sobre la app móvil de Orion a los conductores, sabremos que hemos tenido éxito cuando al menos el 85% complete correctamente los flujos clave (inicio/fin de jornada, reporte de eventos y confirmación de ruta) en el primer mes.

**Hypothesis Statement 05**  
Creemos que implementando sincronización diferida en la app móvil para operar sin señal, sabremos que hemos tenido éxito cuando el 95% de eventos registrados offline se sincronicen correctamente al recuperar conectividad.

**Hypothesis Statement 06**  
Creemos que aplicando caché y control de frecuencia de actualización en Google Maps, sabremos que hemos tenido éxito cuando el costo mensual de consumo de mapas se reduzca en 35% sin afectar la precisión del monitoreo de flota.

<h4 id="1234-lean-ux-canvas">1.2.3.4 Lean UX Canvas</h4>

<p><em>Contenido por desarrollar.</em></p>

<h2 id="13-segmentos-objetivo">1.3 Segmentos objetivo</h2>

<p><em>Contenido por desarrollar.</em></p>
