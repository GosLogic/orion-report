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

<p><em>Contenido por desarrollar.</em></p>

<h3 id="231-user-personas">2.3.1 User Personas</h3>

<p><em>Contenido por desarrollar.</em></p>

<h3 id="232-user-task-matrix">2.3.2 User Task Matrix</h3>

<p><em>Contenido por desarrollar.</em></p>

<h3 id="233-empathy-maps">2.3.3 Empathy Maps</h3>

<p><em>Contenido por desarrollar.</em></p>

<h3 id="234-as-is-scenario-mapping">2.3.4 As-is Scenario Mapping</h3>

<p><em>Contenido por desarrollar.</em></p>
