# Capítulo II: Requirements  & Analysis

Los `id` coinciden con el índice de `00-introduction.md`.

<h2 id="21-competidores">2.1 Competidores</h2>

<p><em>Contenido por desarrollar.</em></p>

<h2 id="22-entrevistas">2.2 Entrevistas</h2>

## 2.2. Entrevistas

### 2.2.1. Diseño de entrevistas

Se realizó una investigación cualitativa mediante entrevistas a los segmentos objetivo de Orion: gestores de flota y conductores de campo. El objetivo fue identificar ineficiencias en los procesos logísticos actuales y validar cómo una arquitectura distribuida puede resolver la falta de visibilidad en tiempo real.

Se estructuraron bloques de preguntas para recopilar datos objetivos (herramientas y procesos) e información subjetiva (frustraciones y expectativas).

#### Segmento 1: Gestores de flota

**Introducción y Contexto:**

1.	¿Cuál es su rol principal y cuántas unidades tiene a su cargo actualmente?
2.	¿Cómo describe el proceso actual de asignación de rutas y despacho?

**Identificación de Pain Points:**

3.	¿Cómo se entera actualmente si un conductor tiene un retraso o una incidencia en ruta? 
4.	¿Cuál es su mayor dificultad al momento de consolidar la información de las entregas al final del día?
5.	 ¿Ha enfrentado problemas de "kilómetros en vacío" o rutas mal optimizadas que eleven sus costos?

**Validación de la Solución:**

6.	Si pudiera ver en un solo panel el estado de todas sus unidades y recibir alertas automáticas, ¿cómo cambiaría su gestión diaria? 
7. ¿Qué indicadores (KPIs) son los más críticos para usted?

#### Segmento 2: Conductores de flota

**Introducción y Contexto:**

1.	¿Cuántas paradas o entregas realiza en un día promedio?
2.	¿Cómo recibe su hoja de ruta cada mañana?

**Identificación de Pain Points:**

3.	¿Cuál es la tarea que más tiempo le quita durante el proceso de entrega (llenar formatos, buscar direcciones, esperar confirmación)?
4.	  ¿Qué sucede cuando llega a un punto y no puede realizar la entrega? ¿Cómo lo reporta? 
5.	 ¿Qué es lo que más le molesta de las aplicaciones que ha usado anteriormente (ej. consume mucha batería, es lenta, difícil de entender)?

**Validación de la Solución:**

6.	¿Qué tan útil le resultaría tener una lista digital donde solo con un botón pueda confirmar la entrega y adjuntar una foto como evidencia? 
7.	 ¿Preferiría una aplicación que funcione con pocos datos móviles y tenga botones grandes para uso rápido?


### 2.2.2. Registro de entrevistas

**Segmento 1: Gestor de flota**

<table border="1">
  <tr>
    <th>Entrevista</th>
    <td>1</td>
    <th>Nombre</th>
    <td>Melisa Espinoza Arroyo</td>
  </tr>
  <tr>
    <th>Edad</th>
    <td>30</td>
    <th>Distrito</th>
    <td>[Insertar Distrito]</td>
  </tr>
  <tr>
    <th>Captura de la entrevista: <img src="assets/chapter-II-assets/Entrevista 1 Gestor.jpg" alt="Captura de la entrevista" width="200"></th>
    <td colspan="3">
        Melisa Espinoza, administradora logística con 8 años de experiencia, supervisa actualmente 25 unidades. Identifica problemas críticos en la falta de un sistema que informe en tiempo real sobre la entrega óptima de mercadería, lo que genera incertidumbre entre el conductor y la base. Además, menciona que el incumplimiento del orden en el carguío respecto a la hoja de ruta provoca un exceso en el consumo de combustible. Valora positivamente una solución integral que permita monitorear entregas, visualizar rutas y, especialmente, controlar el gasto de combustible por kilometraje de forma automatizada. Considera clave optimizar los tiempos de entrega ante la variabilidad de disponibilidad de los clientes.
    </td>
  </tr>
  <tr>
    <th>URL de la grabación</th>
    <td colspan="3">
      <a href="https://youtu.be/kXKhMsL1lxE">
        Ver grabación
      </a>
    </td>
  </tr>
  <tr>
   <th>Timing</th>
    <td colspan="3">
        00:00 - 8:59
    </td>
  </tr>
</table>

**Segmento 2: Conductor de flota**

<table border="1">
  <tr>
    <th>Entrevista</th>
    <td>2</td>
    <th>Nombre</th>
    <td>Carlo Garcia</td>
  </tr>
  <tr>
    <th>Edad</th>
    <td>25>
    <th>Distrito</th>
    <td>San Borja</td>
  </tr>
  <tr>
    <th>Captura de la entrevista: <img src="assets/chapter-II-assets/Entrevista 2 Conductor.jpg" alt="Captura de la entrevista" width="200"></th>
    <td colspan="3">
        Carlo Garcia, conductor con 3 años de experiencia, realiza entre 15 a 20 paradas diarias. Identifica una fricción crítica en el uso de herramientas fragmentadas: debe copiar direcciones de PDFs de WhatsApp hacia Waze, lo que genera errores y pérdida de tiempo. Reporta que la carga administrativa de llenar formularios manuales y enviar confirmaciones repetitivas le quita aproximadamente 30 minutos diarios. Valora una solución "todo en uno" que centralice la toma de evidencias y el reporte de incidentes. Además, destaca la necesidad de una arquitectura "offline-first" debido a la falta de señal en ciertas zonas y una interfaz simplificada con botones visibles para evitar errores operativos.
    </td>
  </tr>
  <tr>
    <th>URL de la grabación</th>
    <td colspan="3">
      <a href="https://www.youtube.com/watch?v=_6LfNBTjb6s">
        Ver grabación
      </a>
    </td>
  </tr>
  <tr>
   <th>Timing</th>
    <td colspan="3">
        00:00 - 08:39
    </td>
  </tr>
</table>

### 2.2.3. Análisis de entrevistas

Las entrevistas se realizaron entre el 5 y el 15 de septiembre de 2025 a un total de 4 participantes: dos conductores y dos mecánicos capacitados de Peru y Venezuela. El objetivo fue identificar patrones comunes en sus frustraciones, expectativas y criterios soluciones digitales en aplicaciones móviles.

**Segmento: Propietarios de vehículos**

**Total entrevistados**: 2

**Edades**: 19 y 21 años

**Distritos**: Ate y La Molina

**Universidad**: Estudiantes universitarios de la UPC

**Vehículos**: Honda CRV 2012 (familiar), Nissan Sunny 2001 (propio)

**Fechas**: Entre el 5 y 9 de septiembre

**Características objetivas**

• Tienen dificultades para encontrar mecánicos de confianza con precios justos: 2/2 (100%)

• Usan referencias de terceros / redes sociales (Facebook, recomendaciones boca a boca) para decidir mecánico: 2/2 (100%)

• Prefieren medios de pago digitales o efectivos (Yape, Plin, QR o efectivo): 2/2 (100%)

• Desean un historial digital de mantenimientos de su vehículo: 2/2 (100%)

• Consideran importante comparar precios antes de aceptar el servicio: 2/2 (100%)

• Valoran que la app permita personalizar opciones (mecánico favorito, horarios, precio máximo, repuestos): 2/2 (100%)

**Características subjetivas**

• Desconfianza hacia los talleres locales por precios inflados o falta de transparencia: 2/2 (100%)

• Consideran que la ubicación del mecánico es un factor clave al decidir (cercanía): 1/2 (50%)

• Priorizan la rapidez en la comunicación con el mecánico (chat, llamada, videollamada): 2/2 (100%)

• Prefieren ver el avance del trabajo con fotos o checklist para mayor control: 2/2 (100%)

• Desean que la plataforma incluya valoraciones y comentarios de otros usuarios como guía: 2/2 (100%)

• Muestran disposición a usar una app siempre que sea intuitiva y rápida: 2/2 (100%)

**Segmento: Mecánicos**

**Total entrevistados**: 2

**Edades**: 40 y 45 años

**Distritos**: San Luis  y Surquillo


**Experiencia**:
- José Castillo: Ingeniero en mantenimiento mecánico con experiencia en diagnósticos, mantenimientos preventivos y gestión operativa.
- Rando Calero: Mecánico especialista en Scania, dueño de taller con 1 año en el mercado.

**Fechas**: Entre el 13 y 15 de septiembre

**Características objetivas**

• Identifican la falta de planificación preventiva como el principal problema de gestión: 2/2 (100%)  
• Consideran esencial el historial digital de cada vehículo para diagnósticos más rápidos: 2/2 (100%)  
• Utilizan actualmente métodos básicos de comunicación (WhatsApp, llamadas): 2/2 (100%)  
• Valoran procesos como registro de solicitudes, seguimiento, alertas y reportes: 2/2 (100%)  
• Prefieren una interfaz clara e intuitiva, con indicadores y paneles visuales: 2/2 (100%)  
• Están abiertos a que los clientes dejen valoraciones y comentarios sobre el servicio: 2/2 (100%)  
• Usan o han considerado usar herramientas digitales complementarias (escáner de vehículos, páginas web, redes sociales): 2/2 (100%)

**Características subjetivas**

• Perciben que la mala comunicación con conductores aumenta costos y retrasa soluciones: 2/2 (100%)  
• Valoran la organización de solicitudes para evitar confusiones o duplicaciones: 2/2 (100%)  
• Consideran clave las notificaciones automáticas de mantenimientos: 2/2 (100%)  
• Desean que la app tenga lenguaje accesible y no excesivamente técnico, para facilitar la adopción: 1/2 (50%)  
• Piensan que la plataforma debe incluir flujo automatizado de trabajo (inicio, mantenimiento en proceso, finalización): 1/2 (50%)  
• Ven con buenos ojos la idea de un sistema de membresías o suscripción para cobros recurrentes: 1/2 (50%)  
• Reconocen que las reseñas negativas pueden dañar la reputación, pero aun así valoran su utilidad para mejorar: 1/2 (50%)

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

