# Capítulo II: Requirements  & Analysis

Los `id` coinciden con el índice de `00-introduction.md`.

<h2 id="21-competidores">2.1 Competidores</h2>

<table border="1">
<thead>
<tr>
<th colspan="7" style="text-align: center;"><b>Competitive Analysis Landscape</b></th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" align="center">¿Por qué llevar a cabo este análisis?</td>
<td colspan="5" align="center">El objetivo es definir el posicionamiento de Orion frente a soluciones líderes de última milla y telemática, identificando cómo nuestra arquitectura basada en microservicios y DDD resuelve las limitaciones de escalabilidad y altos costos de implementación en el mercado de PYMES logísticas.</td>
</tr>
<tr>
<th></th>
<th></th>
<th><b>Orion (GosLogic)</b></th>
<th><b>Beetrack</b> <img src="assets/chapter-ii/competidores/beetrack.png" alt="Fleetio Logo" height="70" width="120"></th>
<th><b>SimpliRoute</b><img src="assets/chapter-ii/competidores/simpliroute.png" alt="Fleetio Logo" height="70" width="120"></th>
<th><b>Samsara</b> <img src="assets/chapter-ii/competidores/samsara.png" alt="Fleetio Logo" height="70" width="120"></th>
</tr>
<tr>
<td><strong>Perfil</strong></td>
<td>Overview</td>
<td>Plataforma de gestión logística y flotas diseñada bajo principios de microservicios y DDD. Optimiza la última milla y la visibilidad operativa de PYMES peruanas mediante una solución ágil y escalable.</td>
<td>Software chileno (DispatchTrack) líder en Latam para trazabilidad de última milla. Se enfoca en el seguimiento de entregas y notificaciones al cliente final en tiempo real.</td>
<td>Plataforma de optimización de rutas impulsada por Inteligencia Artificial, orientada a reducir tiempos de planificación y costos de combustible mediante algoritmos avanzados.</td>
<td>Líder global en "operaciones conectadas". Combina hardware (sensores/cámaras) con software en la nube para seguridad, telemática y cumplimiento normativo a gran escala.</td>
</tr>
<tr>
<td></td>
<td><strong>Ventaja competitiva – ¿Qué valor ofrece al cliente?</strong></td>
<td>Flexibilidad extrema y escalabilidad horizontal; permite integraciones locales rápidas y manejo de picos de demanda sin degradar el rendimiento del sistema.</td>
<td>Panel de control intuitivo y rapidez en la ejecución de pruebas de entrega (firmas/fotos). Alta presencia y soporte en la región.</td>
<td>Reducción de hasta un 80% en tiempo de planificación de rutas gracias a su potente algoritmo de IA y modelos de precios accesibles por vehículo.</td>
<td>Tecnología de punta en seguridad (IA para fatiga del conductor) y una infraestructura extremadamente robusta para flotas masivas.</td>
</tr>
<tr>
<td><strong>Perfil de marketing</strong></td>
<td><strong>Mercado objetivo</strong></td>
<td>Gestores de flota y conductores de PYMES en retail y distribución en Perú (enfocado en sectores con procesos manuales).</td>
<td>Empresas medianas y grandes de retail, consumo masivo y servicios de courier en Latinoamérica.</td>
<td>Empresas de logística y e-commerce que buscan optimizar rutas de entrega y reducir costos operativos.</td>
<td>Grandes corporaciones de transporte, construcción y logística con altos presupuestos y necesidades de seguridad crítica.</td>
</tr>
<tr>
<td></td>
<td><strong>Estrategias de marketing</strong></td>
<td>Enfoque en ingeniería de software de alta calidad, consultoría técnica y demostración de retorno de inversión (ROI) acelerado.</td>
<td>Marketing de contenidos especializado en última milla, webinars y casos de éxito de grandes retailers.</td>
<td>Pruebas gratuitas basadas en el ahorro de combustible y campañas enfocadas en la eficiencia de su algoritmo de IA.</td>
<td>Ventas corporativas (B2B) de alto nivel, presencia en ferias tecnológicas globales y certificaciones de seguridad.</td>
</tr>
<tr>
<td><strong>Perfil de producto</strong></td>
<td><strong>Productos & servicios</strong></td>
<td>Gestión de flotas, monitoreo de conductores, despacho digital, integración con facturación local y analítica de rutas.</td>
<td>Planner Pro (rutas), Last Mile (seguimiento), widgets de seguimiento para el cliente final y reportes de entrega.</td>
<td>Optimización de rutas por IA, seguimiento en vivo, chat con conductores y módulos de gestión de entregas.</td>
<td>Telemática, cámaras de seguridad con IA, sensores de temperatura, gestión de mantenimiento y cumplimiento (ELD).</td>
</tr>
<tr>
<td></td>
<td><strong>Precios & costos</strong></td>
<td>Modelo SaaS con tiers accesibles para PYMES; sin costos de hardware propietario (software-only).</td>
<td>Suscripción basada en volumen de guías/pedidos; costos adicionales por módulos de planificación avanzada.</td>
<td>Suscripción mensual de aprox. USD $40 por vehículo; costos de implementación que pueden ser elevados.</td>
<td>Costo elevado: requiere inversión inicial en hardware propietario y contratos anuales de software por activo.</td>
</tr>
<tr>
<td><strong>Análisis SWOT</strong></td>
<td><strong>Fortalezas</strong></td>
<td>Arquitectura de microservicios que evita fallos en cascada y diseño orientado al dominio (DDD) adaptado al Perú.</td>
<td>Dominio del mercado regional y plataforma muy fácil de usar para el despachador.</td>
<td>Algoritmo de planificación superior que ofrece resultados inmediatos en ahorro de tiempo.</td>
<td>Ecosistema tecnológico inigualable y estándares de seguridad de nivel mundial.</td>
</tr>
<tr>
<td></td>
<td><strong>Debilidades</strong></td>
<td>Startup en etapa inicial con necesidad de validar marca en un mercado con competidores grandes.</td>
<td>Saturación del sistema (lentitud) ante grandes volúmenes y poca flexibilidad en la personalización de rutas.</td>
<td>Implementación lenta (hasta 3 meses) y ROI de largo plazo (16 meses) para pequeñas empresas.</td>
<td>Precios prohibitivos para PYMES peruanas y falta de conocimiento de las carencias viales locales.</td>
</tr>
<tr>
<td></td>
<td><strong>Oportunidades</strong></td>
<td>Migración de empresas hacia arquitecturas Cloud Native; apertura del Puerto de Chancay.</td>
<td>Expansión global bajo el respaldo de DispatchTrack.</td>
<td>Integración de modelos predictivos de demanda para PYMES.</td>
<td>Creciente regulación de seguridad vial en mercados emergentes.</td>
</tr>
<tr>
<td></td>
<td><strong>Amenazas</strong></td>
<td>Competidores con mayor espalda financiera bajando precios para captar el sector PYME.</td>
<td>Nuevos jugadores tecnológicos con arquitecturas más modernas y ágiles.</td>
<td>Sustitución por módulos logísticos básicos integrados en ERPs genéricos.</td>
<td>Inestabilidad económica regional que frene inversiones en hardware costoso.</td>
</tr>
</tbody>
</table>

<h2 id="22-entrevistas">2.2 Entrevistas</h2>

<p><em>Contenido por desarrollar.</em></p>

<h2 id="23-needfinding">2.3 Needfinding</h2>

<h3 id="231-user-personas">2.3.1 User Personas</h3>

Para desarrollar la propuesta de solución, se creará un _User Persona_ por cada segmento objetivo. Este tendrá información relacionada a una persona que pertenezca al segmento objetivo respectivo ya sea información personal, gustos, usos tecnológicos u objetivos. De esta forma, se podrá dar una idea más clara de a qué publico nos estamos acercando con la idea de solución. Además, se realiza una conclusión del análisis de cada User Persona.

<b> User Persona 1: Gestor de Flota </b>

<p align="center">
  <img src="assets/chapter-ii/UserPersona1.png"" 
  alt="user_persona1" style="width: 600px;"/>
</p>

En esta imagen, se presenta información relacionada al user persona gestor de flota. El cuadro incluye una breve descripción de su perfil, así como sus principales objetivos y frustraciones dentro de su entorno laboral. Esta representación permite comprender mejor sus necesidades, como contar con una visión centralizada de la operación, optimizar la gestión de vehículos y conductores, y reducir fallas mediante mantenimiento preventivo. Esta información fue clave para plantear una solución que mejore la eficiencia operativa y facilite la toma de decisiones en tiempo real.

<b> User Persona 2: Conductor de Flota</b>

<p align="center">
  <img src="assets/chapter-ii/UserPersona2.png"" 
  alt="user_persona2" style="width: 600px;"/>
</p>

En esta imagen, se presenta información relacionada al user persona conductor de flota. El cuadro describe su perfil, junto con sus objetivos y frustraciones en su trabajo diario. Esta representación ayuda a entender sus necesidades, como disponer de instrucciones claras, contar con una herramienta simple de usar y poder trabajar incluso en condiciones de conectividad limitada. Esta información fue fundamental para diseñar una solución que simplifique sus tareas, reduzca la dependencia de procesos manuales y mejore su experiencia durante la ejecución de rutas.


<h3 id="232-user-task-matrix">2.3.2 User Task Matrix</h3>

<p><em>Contenido por desarrollar.</em></p>

<h3 id="233-empathy-maps">2.3.3 Empathy Maps</h3>

El _Empathy Mapping_ ayuda a entender de manera más profunda a nuestro User Persona. Con esta herramienta, capturamos lo que el usuario siente, dice, piensa y hace desde la perspectiva del propio usuario. Además, nos ayuda a identificar dolores y metas qué desea cumplir que nos serán útiles para formar ideas de diseño útiles para el producto que servirá como solución. Finalmente, cada mapa de empatía se diseñó en la aplicación UXPressia.

<b> User Persona 1: Gestor de Flota </b>

En esta primera imagen que se muestra a continuación, se visualiza el empathy map del user persona gestor de flota. En esta misma, se detalla lo que el usuario siente, dice, piensa y hace al momento de gestionar la operación diaria de la flota vehicular. Se busca comprender cómo enfrenta la falta de información centralizada, la presión por mantener la eficiencia y la necesidad de anticiparse a fallas, lo cual permite identificar oportunidades de mejora en la toma de decisiones y en la optimización de procesos.

<p align="center">
  <img src="assets/chapter-ii/Empathy map1.png"" 
  alt="empathy_mapping1" style="width: 600px;"/>
</p>

<b> User Persona 2: Conductor de Flota</b>

En esta segunda imagen que se muestra a continuación, se visualiza el empathy map del user persona conductor de flota. En esta, se describe lo que el usuario siente, dice, piensa y hace durante la ejecución de sus rutas y el cumplimiento de sus tareas diarias. Se pretende entender las dificultades que enfrenta, como la falta de claridad en instrucciones, los problemas de conectividad y la dependencia de procesos manuales, con el fin de proponer soluciones que faciliten su trabajo y mejoren su experiencia.

<p align="center">
  <img src="assets/chapter-ii/Empathy map2.png"" 
  alt="empathy_mapping2" style="width: 600px;"/>
</p>

<h3 id="234-as-is-scenario-mapping">2.3.4 As-is Scenario Mapping</h3>

En el As-Is Scenario Map se representa la situación actual que experimentan los usuarios antes de la implementación de la solución propuesta. Este mapa permite identificar los principales problemas y limitaciones que enfrentan los user persona, evidenciando aquellos puntos críticos que dificultan el cumplimiento de sus objetivos y que deben ser abordados en el diseño del sistema.

De esta manera, se desarrollaron los mapas AS-IS para cada user persona considerando su contexto dentro de la gestión de flotas. El proceso inició con la identificación de las fases más relevantes en sus actividades diarias. Posteriormente, en cada fase se definieron las acciones que realizan habitualmente. Luego, se analizaron los pensamientos que podrían surgir durante la ejecución de dichas actividades, adoptando la perspectiva de cada usuario. Finalmente, se identificaron las emociones asociadas a estos pensamientos, lo que permitió reconocer los aspectos negativos predominantes en la experiencia actual y detectar oportunidades de mejora que serán consideradas en la propuesta de solución.

<b> User Persona 1: Gestor de Flota </b>

En esta primera imagen que se muestra a continuación, se visualiza el As-Is Scenario Map del user persona gestor de flota. En esta misma, se detalla el proceso que sigue al iniciar su jornada y gestionar la operación diaria sin un sistema centralizado. Para ello, revisa información en distintas fuentes, coordina manualmente con los conductores y atiende incidencias conforme aparecen, lo que genera retrasos, desorganización y una alta carga operativa.

<p align="center">
  <img src="assets/chapter-ii/ASIS1.png"" 
  alt="ASIS1" style="width: 600px;"/>
</p>

<b> User Persona 2: Conductor de Flota</b>

En esta segunda imagen que se muestra a continuación, se visualiza el As-Is Scenario Map del user persona conductor de flota. En esta, se describe el proceso que realiza desde que inicia su jornada hasta que finaliza sus actividades, dependiendo de instrucciones recibidas por medios informales. Para ello, revisa rutas de forma manual, se comunica constantemente con su supervisor y reporta su jornada de manera poco estructurada, lo que dificulta su trabajo y genera ineficiencias.

<p align="center">
  <img src="assets/chapter-ii/ASIS2.png"" 
  alt="ASIS2" style="width: 600px;"/>
</p>

