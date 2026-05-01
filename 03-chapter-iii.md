# Capítulo III: Requirements Specification

<h2 id="31-to-be-scenario-mapping">3.1 To-Be Scenario Mapping</h2>

En el To-Be Scenario Map se representa la experiencia del usuario considerando la implementación de la solución propuesta. Este mapa se construye a partir del análisis del AS-IS, con el objetivo de evidenciar cómo el sistema puede mejorar las actividades y procesos que realiza cada user persona en su día a día.


De esta manera, se desarrollaron los mapas TO-BE para cada user persona tomando como base las situaciones identificadas previamente. El proceso inició con la revisión de cada fase del AS-IS, identificando oportunidades de mejora que la plataforma Orion podría ofrecer. Posteriormente, se redefinieron aquellas actividades que serían optimizadas mediante el uso del sistema, incorporando automatización, centralización de la información y monitoreo en tiempo real. Luego, se analizaron los pensamientos que surgirían al utilizar la solución, adoptando la perspectiva de cada usuario. A continuación, se identificaron las emociones asociadas a estos nuevos escenarios, permitiendo evidenciar una mejora en la experiencia general. Finalmente, se evaluaron los aspectos positivos predominantes y cómo la solución contribuye a reducir los problemas detectados en la situación actual.

<b> User Persona 1: Gestor de Flota </b>

<p align="center">
  <img src="assets/chapter-iii/TOBE1.png"" 
  alt="TOBE1" style="width: 600px;"/>
</p>

Al comparar ambos mapas, se evidencia una mejora significativa en la gestión de la flota vehicular del gestor de flota. Esta mejora no solo optimiza las tareas operativas, sino que también le permite dedicar más tiempo a actividades estratégicas como la planificación y la toma de decisiones. Además, se reduce la ocurrencia de fallas inesperadas y descoordinaciones, gracias al monitoreo en tiempo real y a las alertas de mantenimiento preventivo, lo que facilita un mayor control de la operación.

<b> User Persona 2: Conductor de Flota </b>

<p align="center">
  <img src="assets/chapter-iii/TOBE2.png"" 
  alt="TOBE" style="width: 600px;"/>
</p>

Al comparar ambos mapas, se observa una mejora en la experiencia del conductor de flota durante la ejecución de sus actividades. Esta mejora simplifica sus tareas diarias, permitiéndole trabajar con mayor claridad y menor esfuerzo. Asimismo, se reducen problemas como la falta de información o la dependencia de procesos manuales, ya que ahora cuenta con una aplicación que le brinda instrucciones claras, seguimiento de su recorrido y registro automático de su jornada, mejorando así su desempeño y comodidad en el trabajo.

<h2 id="32-user-stories">3.2 User Stories</h2>

<p>En esta sección se presentan las épicas funcionales del producto Orion, redactadas para organizar las User Stories que guían el alcance del proyecto. Los requisitos no funcionales se detallan de forma separada en la sección 3.2.3.</p>

<h3 id="321-epics">3.2.1 Epics</h3>

<table border="1" style="border-collapse: collapse; width: 100%; font-size: 0.95rem;">
  <thead>
    <tr>
      <th style="padding: 0.5rem;">Epic ID</th>
      <th style="padding: 0.5rem;">Título</th>
      <th style="padding: 0.5rem;">Descripción</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 0.5rem;">E01</td>
      <td style="padding: 0.5rem;">Gestión Multi-Tenant y Seguridad</td>
      <td style="padding: 0.5rem;">Como administrador de plataforma, quiero gestionar tenants, accesos y protección de información, para garantizar aislamiento seguro entre empresas clientes.</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">E02</td>
      <td style="padding: 0.5rem;">Monitoreo y Telemetría</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero visualizar posiciones, rutas y eventos en tiempo real, para mejorar el control operativo diario.</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">E03</td>
      <td style="padding: 0.5rem;">Mantenimiento Preventivo</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero programar mantenimientos y controlar el estado técnico de las unidades, para reducir fallas y evitar multas.</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">E04</td>
      <td style="padding: 0.5rem;">Gestión de Despacho Operativo</td>
      <td style="padding: 0.5rem;">Como coordinador de operaciones, quiero asignar conductores, vehículos y rutas de forma dinámica, para optimizar recursos según la demanda.</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">E05</td>
      <td style="padding: 0.5rem;">App Móvil del Conductor</td>
      <td style="padding: 0.5rem;">Como conductor, quiero registrar mi jornada y reportar incidencias desde la app, para mantener trazabilidad y respuesta rápida en campo.</td>
    </tr>
  </tbody>
</table>

<h3 id="322-user-stories">3.2.2 User Stories</h3>

<p>Requisitos definidos junto con el conjunto de User Stories y Epics para los requisitos identificados. Los User Stories incluyen Acceptance Criteria.</p>

<table border="1" style="border-collapse: collapse; width: 100%; font-size: 0.95rem;">
  <thead>
    <tr>
      <th style="padding: 0.5rem;">Epic / User Story ID</th>
      <th style="padding: 0.5rem;">Título</th>
      <th style="padding: 0.5rem;">Descripción</th>
      <th style="padding: 0.5rem;">Criterios de Aceptación</th>
      <th style="padding: 0.5rem;">Relacionado con (Epic ID)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 0.5rem;">US01</td>
      <td style="padding: 0.5rem;">Configuración de Tenant</td>
      <td style="padding: 0.5rem;">Como administrador del sistema, quiero crear perfiles de empresa únicos, para que cada cliente tenga su propio espacio de trabajo aislado.</td>
      <td style="padding: 0.5rem;">Escenario 1: Crear tenant con datos válidos<br>DADO que el administrador está autenticado<br>CUANDO registra una empresa con datos completos y válidos<br>ENTONCES el sistema debe crear un tenantId único<br><br>Escenario 2: Validar campos obligatorios<br>DADO que el administrador está en el formulario de creación<br>CUANDO intenta guardar sin completar campos obligatorios<br>ENTONCES el sistema debe bloquear el registro y mostrar los campos faltantes<br><br>Escenario 3: Evitar duplicidad de empresa<br>DADO que ya existe una empresa con el mismo identificador tributario<br>CUANDO el administrador intenta crearla nuevamente<br>ENTONCES el sistema debe rechazar la operación por duplicidad<br><br>Escenario 4: Confirmar estado inicial del tenant<br>DADO que el tenant fue creado correctamente<br>CUANDO el administrador consulta su detalle<br>ENTONCES el sistema debe mostrarlo como activo con configuración base</td>
      <td style="padding: 0.5rem;">E01</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US02</td>
      <td style="padding: 0.5rem;">Aislamiento de Datos</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero que mis datos de conductores y rutas sean invisibles para otras empresas, para garantizar la privacidad comercial.</td>
      <td style="padding: 0.5rem;">Escenario 1: Bloquear acceso entre tenants<br>DADO que un usuario pertenece al tenant A<br>CUANDO intenta consultar datos del tenant B<br>ENTONCES el sistema debe denegar el acceso<br><br>Escenario 2: Restringir resultados al tenant autenticado<br>DADO que el usuario realiza una búsqueda de rutas o conductores<br>CUANDO el sistema procesa la consulta<br>ENTONCES solo debe devolver información del tenant autenticado<br><br>Escenario 3: Verificar fuga de datos<br>DADO que se ejecutan pruebas de seguridad inter-tenant<br>CUANDO se revisan los resultados<br>ENTONCES no debe existir exposición de datos entre empresas</td>
      <td style="padding: 0.5rem;">E01</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US03</td>
      <td style="padding: 0.5rem;">Gestión de Usuarios y Roles</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero invitar usuarios con roles específicos, para delegar la supervisión de la flota.</td>
      <td style="padding: 0.5rem;">Escenario 1: Invitar usuario con rol<br>DADO que el gestor tiene permisos de administración<br>CUANDO envía una invitación y asigna un rol<br>ENTONCES el sistema debe registrar la invitación en estado pendiente<br><br>Escenario 2: Completar registro del invitado<br>DADO que el usuario recibió su invitación<br>CUANDO acepta y completa sus datos<br>ENTONCES el sistema debe asociarlo al tenant correcto<br><br>Escenario 3: Restringir permisos por rol<br>DADO que el usuario tiene rol monitor<br>CUANDO intenta ingresar a módulos administrativos<br>ENTONCES el sistema debe bloquear el acceso<br><br>Escenario 4: Auditar cambios de rol<br>DADO que un administrador modifica un rol<br>CUANDO confirma el cambio<br>ENTONCES el sistema debe actualizar permisos y guardar trazabilidad</td>
      <td style="padding: 0.5rem;">E01</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US04</td>
      <td style="padding: 0.5rem;">Autenticación JWT</td>
      <td style="padding: 0.5rem;">Como gestor, quiero acceder mediante tokens JWT, para asegurar autenticación robusta en el sistema.</td>
      <td style="padding: 0.5rem;">Escenario 1: Login exitoso<br>DADO que el usuario ingresa credenciales válidas<br>CUANDO presiona Iniciar sesión<br>ENTONCES el sistema debe emitir un token JWT válido<br><br>Escenario 2: Login fallido<br>DADO que el usuario ingresa credenciales incorrectas<br>CUANDO intenta autenticarse<br>ENTONCES el sistema debe mostrar mensaje de error de autenticación<br><br>Escenario 3: Acceso con token inválido<br>DADO que el usuario consume una API protegida con token inválido o vencido<br>CUANDO el backend valida el token<br>ENTONCES debe responder con estado no autorizado</td>
      <td style="padding: 0.5rem;">E01</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US05</td>
      <td style="padding: 0.5rem;">Expiración de Sesión</td>
      <td style="padding: 0.5rem;">Como gestor, quiero que la sesión expire automáticamente tras inactividad, para reducir el riesgo de acceso no autorizado.</td>
      <td style="padding: 0.5rem;">Escenario 1: Expirar sesión por inactividad<br>DADO que el usuario tiene sesión activa<br>CUANDO transcurren 30 minutos sin interacción<br>ENTONCES el sistema debe expirar la sesión automáticamente<br><br>Escenario 2: Solicitar reautenticación<br>DADO que la sesión ya expiró<br>CUANDO el usuario intenta acceder a un módulo protegido<br>ENTONCES el sistema debe redirigirlo al inicio de sesión<br><br>Escenario 3: Mantener sesión con actividad<br>DADO que el usuario mantiene actividad dentro del periodo permitido<br>CUANDO navega entre módulos<br>ENTONCES el sistema debe conservar su sesión activa</td>
      <td style="padding: 0.5rem;">E01</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US06</td>
      <td style="padding: 0.5rem;">Cifrado HTTPS de Telemetría</td>
      <td style="padding: 0.5rem;">Como administrador, quiero que toda la telemetría se transmita vía HTTPS, para evitar interceptación de datos.</td>
      <td style="padding: 0.5rem;">Escenario 1: Aceptar tráfico seguro<br>DADO que la telemetría se envía por HTTPS<br>CUANDO llega al backend<br>ENTONCES el sistema debe procesarla correctamente<br><br>Escenario 2: Rechazar tráfico no seguro<br>DADO que se intenta enviar telemetría por HTTP<br>CUANDO el request entra al sistema<br>ENTONCES debe ser rechazado o redirigido a HTTPS<br><br>Escenario 3: Verificar cumplimiento de cifrado<br>DADO una auditoría de comunicaciones<br>CUANDO se revisan los endpoints productivos<br>ENTONCES toda transmisión de telemetría debe estar cifrada</td>
      <td style="padding: 0.5rem;">E01</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US07</td>
      <td style="padding: 0.5rem;">Filtro Obligatorio por TenantId</td>
      <td style="padding: 0.5rem;">Como arquitecto, quiero que toda consulta a BD incluya TenantId, para asegurar 0% de fuga entre empresas.</td>
      <td style="padding: 0.5rem;">Escenario 1: Aplicar filtro obligatorio<br>DADO que se ejecuta una consulta de negocio<br>CUANDO accede a la base de datos<br>ENTONCES la consulta debe incluir tenantId obligatoriamente<br><br>Escenario 2: Bloquear consultas inseguras<br>DADO que una consulta no incluye tenantId<br>CUANDO intenta ejecutarse<br>ENTONCES el sistema debe rechazarla por política de seguridad<br><br>Escenario 3: Validar aislamiento en integración<br>DADO pruebas de integración multi-tenant<br>CUANDO se prueban endpoints de lectura<br>ENTONCES solo deben retornar datos del tenant autenticado<br><br>Escenario 4: Registrar accesos críticos<br>DADO una operación sensible sobre datos<br>CUANDO se completa la consulta<br>ENTONCES el sistema debe guardar traza de auditoría</td>
      <td style="padding: 0.5rem;">E01</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US08</td>
      <td style="padding: 0.5rem;">Visualización en Mapa</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero ver la ubicación en tiempo real de mis vehículos, para optimizar la logística.</td>
      <td style="padding: 0.5rem;">Escenario 1: Mostrar unidades activas<br>DADO que existen vehículos transmitiendo GPS<br>CUANDO el gestor abre el mapa<br>ENTONCES el sistema debe mostrar marcadores por unidad<br><br>Escenario 2: Actualizar posiciones en tiempo real<br>DADO que llegan nuevas coordenadas<br>CUANDO el evento es procesado<br>ENTONCES la ubicación en mapa debe refrescarse automáticamente<br><br>Escenario 3: Identificar unidad sin señal<br>DADO que una unidad deja de enviar eventos<br>CUANDO supera el umbral de inactividad<br>ENTONCES el sistema debe marcarla como desactualizada<br><br>Escenario 4: Filtrar visualización<br>DADO múltiples unidades visibles<br>CUANDO el gestor aplica filtros por estado o zona<br>ENTONCES el mapa debe mostrar solo las unidades filtradas</td>
      <td style="padding: 0.5rem;">E02</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US09</td>
      <td style="padding: 0.5rem;">Historial de Rutas</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero consultar el recorrido histórico de una unidad, para verificar el cumplimiento de las rutas.</td>
      <td style="padding: 0.5rem;">Escenario 1: Consultar por fecha y unidad<br>DADO una unidad seleccionada<br>CUANDO el gestor define un rango de fechas<br>ENTONCES el sistema debe mostrar el recorrido histórico correspondiente<br><br>Escenario 2: Ver detalle de traza<br>DADO una ruta histórica disponible<br>CUANDO el gestor abre su detalle<br>ENTONCES debe visualizar hora, posición y eventos asociados<br><br>Escenario 3: Manejar consulta sin resultados<br>DADO un rango sin datos registrados<br>CUANDO se ejecuta la búsqueda<br>ENTONCES el sistema debe informar que no existen recorridos</td>
      <td style="padding: 0.5rem;">E02</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US10</td>
      <td style="padding: 0.5rem;">Gestión de Geocercas</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero definir zonas permitidas, para recibir alertas cuando un vehículo salga del perímetro autorizado.</td>
      <td style="padding: 0.5rem;">Escenario 1: Crear geocerca<br>DADO que el gestor está en el módulo de geocercas<br>CUANDO define un perímetro válido y lo guarda<br>ENTONCES el sistema debe registrar la geocerca para su tenant<br><br>Escenario 2: Editar geocerca<br>DADO una geocerca existente<br>CUANDO el gestor modifica nombre o perímetro<br>ENTONCES el sistema debe actualizar la configuración<br><br>Escenario 3: Eliminar geocerca<br>DADO una geocerca activa<br>CUANDO el gestor solicita eliminarla<br>ENTONCES el sistema debe pedir confirmación antes de borrar<br><br>Escenario 4: Asociar geocerca a operación<br>DADO una geocerca creada<br>CUANDO se asocia a una flota o ruta<br>ENTONCES debe quedar habilitada para monitoreo</td>
      <td style="padding: 0.5rem;">E02</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US11</td>
      <td style="padding: 0.5rem;">Alertas por Geocerca</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero recibir alertas si un vehículo sale del perímetro autorizado, para actuar oportunamente.</td>
      <td style="padding: 0.5rem;">Escenario 1: Detectar salida de perímetro<br>DADO que el vehículo está dentro de una geocerca<br>CUANDO cruza el límite hacia afuera<br>ENTONCES el sistema debe generar una alerta inmediata<br><br>Escenario 2: Mostrar información de alerta<br>DADO una alerta generada<br>CUANDO el gestor la revisa<br>ENTONCES debe ver unidad, hora y ubicación exacta<br><br>Escenario 3: Registrar reingreso<br>DADO que el vehículo vuelve al perímetro<br>CUANDO reingresa a la geocerca<br>ENTONCES el sistema debe registrar evento de normalización<br><br>Escenario 4: Priorizar alertas simultáneas<br>DADO múltiples alertas activas<br>CUANDO se listan en el panel<br>ENTONCES el sistema debe ordenarlas por criticidad y recencia</td>
      <td style="padding: 0.5rem;">E02</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US12</td>
      <td style="padding: 0.5rem;">Alertas de Kilometraje</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero recibir alertas automáticas de cambio de aceite, para evitar daños mecánicos por exceso de uso.</td>
      <td style="padding: 0.5rem;">Escenario 1: Generar alerta por umbral<br>DADO un umbral configurado para mantenimiento<br>CUANDO el kilometraje supera el límite<br>ENTONCES el sistema debe crear una alerta automática<br><br>Escenario 2: Notificar al responsable<br>DADO una alerta de mantenimiento activa<br>CUANDO el gestor abre notificaciones<br>ENTONCES debe visualizar unidad afectada y tipo de servicio recomendado<br><br>Escenario 3: Reiniciar ciclo tras mantenimiento<br>DADO que se registró el servicio realizado<br>CUANDO se confirma el mantenimiento<br>ENTONCES el sistema debe reiniciar el ciclo de control de kilometraje<br><br>Escenario 4: Visualizar próximos mantenimientos<br>DADO varias unidades registradas<br>CUANDO el gestor consulta el panel<br>ENTONCES debe ver el orden de prioridad por proximidad al umbral</td>
      <td style="padding: 0.5rem;">E03</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US13</td>
      <td style="padding: 0.5rem;">Registro de Activos</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero registrar el estado de neumáticos y frenos, para proyectar gastos de renovación anual.</td>
      <td style="padding: 0.5rem;">Escenario 1: Registrar estado técnico<br>DADO una unidad seleccionada<br>CUANDO el gestor registra estado de frenos y neumáticos<br>ENTONCES el sistema debe guardar estado, fecha y responsable<br><br>Escenario 2: Consultar historial técnico<br>DADO que existen inspecciones previas<br>CUANDO el gestor consulta la unidad<br>ENTONCES debe visualizar el historial cronológico de evaluaciones<br><br>Escenario 3: Alertar condición crítica<br>DADO que una inspección reporta estado crítico<br>CUANDO se guarda el registro<br>ENTONCES el sistema debe emitir una alerta preventiva</td>
      <td style="padding: 0.5rem;">E03</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US14</td>
      <td style="padding: 0.5rem;">Control de Revisiones Técnicas</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero programar revisiones legales, para evitar multas por documentos vencidos.</td>
      <td style="padding: 0.5rem;">Escenario 1: Programar vencimientos<br>DADO un vehículo con documentación vigente<br>CUANDO se registran fechas de revisión<br>ENTONCES el sistema debe programar recordatorios automáticos<br><br>Escenario 2: Alertar vencimiento próximo<br>DADO una revisión cercana a su fecha límite<br>CUANDO entra en ventana de alerta<br>ENTONCES el sistema debe notificar al responsable<br><br>Escenario 3: Marcar riesgo legal<br>DADO una revisión vencida<br>CUANDO el gestor revisa el estado del vehículo<br>ENTONCES el sistema debe mostrar riesgo legal activo</td>
      <td style="padding: 0.5rem;">E03</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US15</td>
      <td style="padding: 0.5rem;">Asignación Dinámica</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero asignar conductores a vehículos y rutas específicas según la demanda del día.</td>
      <td style="padding: 0.5rem;">Escenario 1: Asignar despacho válido<br>DADO conductores, vehículos y rutas disponibles<br>CUANDO el gestor confirma la asignación<br>ENTONCES el sistema debe registrar el despacho exitosamente<br><br>Escenario 2: Bloquear conductor no disponible<br>DADO un conductor fuera de turno<br>CUANDO el gestor intenta asignarlo<br>ENTONCES el sistema debe impedir la asignación<br><br>Escenario 3: Detectar conflicto de recurso<br>DADO un vehículo ocupado en el mismo horario<br>CUANDO se intenta asignar otra ruta<br>ENTONCES el sistema debe mostrar conflicto de solapamiento<br><br>Escenario 4: Reasignar recurso<br>DADO una asignación existente<br>CUANDO el gestor cambia conductor o unidad<br>ENTONCES el sistema debe actualizar el despacho y notificar a involucrados<br><br>Escenario 5: Mantener trazabilidad<br>DADO cualquier alta o cambio de asignación<br>CUANDO se guarda la operación<br>ENTONCES el sistema debe registrar usuario, fecha y motivo del cambio</td>
      <td style="padding: 0.5rem;">E04</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US16</td>
      <td style="padding: 0.5rem;">Disponibilidad de Personal</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero ver quién está en turno activo, para no sobrepasar las horas permitidas de manejo.</td>
      <td style="padding: 0.5rem;">Escenario 1: Visualizar estado de turnos<br>DADO conductores registrados<br>CUANDO el gestor abre el panel de disponibilidad<br>ENTONCES debe ver estado por turno y zona<br><br>Escenario 2: Controlar límite de horas<br>DADO un conductor con horas máximas excedidas<br>CUANDO se intenta asignar una ruta<br>ENTONCES el sistema debe bloquear la asignación<br><br>Escenario 3: Reflejar cambios en tiempo real<br>DADO que un conductor cambia de estado<br>CUANDO se actualiza su turno<br>ENTONCES el panel debe reflejar el cambio inmediatamente<br><br>Escenario 4: Filtrar personal elegible<br>DADO múltiples conductores activos<br>CUANDO el gestor aplica filtros operativos<br>ENTONCES el sistema debe mostrar solo los aptos para asignación</td>
      <td style="padding: 0.5rem;">E04</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US17</td>
      <td style="padding: 0.5rem;">Reporte de Jornada</td>
      <td style="padding: 0.5rem;">Como conductor, quiero marcar inicio y fin de jornada desde la app, para que mi tiempo laborado quede registrado.</td>
      <td style="padding: 0.5rem;">Escenario 1: Iniciar jornada<br>DADO conductor autenticado en la app<br>CUANDO presiona Iniciar jornada<br>ENTONCES el sistema debe registrar la hora de inicio<br><br>Escenario 2: Finalizar jornada<br>DADO una jornada iniciada<br>CUANDO presiona Finalizar jornada<br>ENTONCES el sistema debe registrar hora de cierre y duración<br><br>Escenario 3: Evitar cierre inválido<br>DADO que no existe jornada iniciada<br>CUANDO intenta finalizar jornada<br>ENTONCES el sistema debe bloquear la acción e informar el motivo</td>
      <td style="padding: 0.5rem;">E05</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US18</td>
      <td style="padding: 0.5rem;">Recepción de Horarios</td>
      <td style="padding: 0.5rem;">Como conductor, quiero ver mi cronograma diario en el móvil, para saber qué unidad debo operar.</td>
      <td style="padding: 0.5rem;">Escenario 1: Ver cronograma del día<br>DADO que el conductor tiene asignaciones<br>CUANDO abre el módulo de cronograma<br>ENTONCES el sistema debe mostrar ruta, hora y unidad asignada<br><br>Escenario 2: Actualizar cambios de despacho<br>DADO que el gestor modifica una asignación<br>CUANDO el cambio se confirma<br>ENTONCES la app del conductor debe reflejar la actualización<br><br>Escenario 3: Mostrar ausencia de tareas<br>DADO que el conductor no tiene asignaciones<br>CUANDO ingresa al cronograma<br>ENTONCES el sistema debe mostrar estado sin tareas programadas</td>
      <td style="padding: 0.5rem;">E05</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US19</td>
      <td style="padding: 0.5rem;">Reporte de Incidentes</td>
      <td style="padding: 0.5rem;">Como conductor, quiero enviar fotos de fallas mecánicas desde la app, para que el gestor programe el taller de inmediato.</td>
      <td style="padding: 0.5rem;">Escenario 1: Reportar con evidencia<br>DADO una falla detectada en ruta<br>CUANDO el conductor registra descripción y adjunta fotografía<br>ENTONCES el sistema debe crear el incidente con evidencia<br><br>Escenario 2: Validar campos obligatorios<br>DADO un reporte incompleto<br>CUANDO intenta enviarlo<br>ENTONCES el sistema debe bloquear el registro y mostrar errores<br><br>Escenario 3: Notificar al gestor<br>DADO un incidente registrado correctamente<br>CUANDO el sistema lo procesa<br>ENTONCES debe notificar al gestor de flota<br><br>Escenario 4: Priorizar incidencia crítica<br>DADO una incidencia de severidad alta<br>CUANDO se clasifica el reporte<br>ENTONCES el sistema debe destacarlo con prioridad máxima</td>
      <td style="padding: 0.5rem;">E05</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US20</td>
      <td style="padding: 0.5rem;">Botón de Pánico</td>
      <td style="padding: 0.5rem;">Como conductor, quiero activar una alerta de emergencia, para que la central reciba mi ubicación exacta al instante.</td>
      <td style="padding: 0.5rem;">Escenario 1: Emitir alerta de emergencia<br>DADO conductor en operación<br>CUANDO presiona el botón de pánico<br>ENTONCES el sistema debe enviar alerta con ubicación GPS actual<br><br>Escenario 2: Recepción en central<br>DADO una alerta emitida<br>CUANDO llega al centro de monitoreo<br>ENTONCES la central debe visualizar unidad, hora y coordenadas<br><br>Escenario 3: Reintento por conectividad<br>DADO conectividad inestable<br>CUANDO falle el primer envío<br>ENTONCES la app debe reintentar automáticamente hasta confirmar recepción<br><br>Escenario 4: Trazabilidad de atención<br>DADO que la alerta fue recibida<br>CUANDO el operador inicia atención<br>ENTONCES el sistema debe registrar el estado del caso<br><br>Escenario 5: Cancelación controlada<br>DADO una activación accidental<br>CUANDO el conductor solicita cancelar la alerta<br>ENTONCES el sistema debe requerir validación y dejar registro del evento</td>
      <td style="padding: 0.5rem;">E05</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US21</td>
      <td style="padding: 0.5rem;">Persistencia Local Offline</td>
      <td style="padding: 0.5rem;">Como conductor, quiero que la app móvil guarde eventos offline en SQLite, para garantizar la experiencia en zonas sin señal.</td>
      <td style="padding: 0.5rem;">Escenario 1: Guardar evento sin red<br>DADO ausencia de conectividad<br>CUANDO el conductor registra un evento<br>ENTONCES la app debe almacenarlo en SQLite local<br><br>Escenario 2: Persistencia tras reinicio<br>DADO eventos pendientes guardados localmente<br>CUANDO la app se cierra y se vuelve a abrir<br>ENTONCES los eventos deben mantenerse disponibles<br><br>Escenario 3: Consultar cola local<br>DADO múltiples eventos offline<br>CUANDO el conductor revisa pendientes<br>ENTONCES el sistema debe mostrarlos en orden cronológico</td>
      <td style="padding: 0.5rem;">E05</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US22</td>
      <td style="padding: 0.5rem;">Sincronización Inteligente</td>
      <td style="padding: 0.5rem;">Como conductor, quiero que la app sincronice automáticamente los datos pendientes al recuperar señal, para no perder información registrada en modo offline.</td>
      <td style="padding: 0.5rem;">Escenario 1: Sincronizar al recuperar señal<br>DADO que vuelve la conectividad<br>CUANDO inicia el proceso de sincronización<br>ENTONCES la app debe enviar la cola pendiente automáticamente<br><br>Escenario 2: Aplicar backoff exponencial<br>DADO un error temporal del servidor<br>CUANDO falle un intento de envío<br>ENTONCES el sistema debe reintentar con backoff exponencial<br><br>Escenario 3: Evitar duplicados<br>DADO un evento ya confirmado por backend<br>CUANDO finaliza la sincronización<br>ENTONCES no debe reenviarse ni duplicarse<br><br>Escenario 4: Limpiar pendientes enviados<br>DADO que todos los eventos fueron aceptados<br>CUANDO termina el proceso<br>ENTONCES la app debe marcar la cola local como sincronizada</td>
      <td style="padding: 0.5rem;">E05</td>
    </tr>

  </tbody>
</table>

<h3 id="323-quality-attribute-requirements">3.2.3 Requisitos No Funcionales (Atributos de Calidad)</h3>

<table border="1" style="border-collapse: collapse; width: 100%; font-size: 0.95rem;">
  <thead>
    <tr>
      <th style="padding: 0.5rem;">RNF ID</th>
      <th style="padding: 0.5rem;">Pilar</th>
      <th style="padding: 0.5rem;">Título</th>
      <th style="padding: 0.5rem;">Descripción</th>
      <th style="padding: 0.5rem;">Escenarios de Calidad</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 0.5rem;">RNF01</td>
      <td style="padding: 0.5rem;">Interoperabilidad</td>
      <td style="padding: 0.5rem;">Integración Estandarizada con Servicios Externos</td>
      <td style="padding: 0.5rem;">Como integrador de GosLogic, quiero interoperar con APIs externas de mapasx y GPS mediante contratos versionados, para asegurar integración continua con bajo impacto ante cambios de proveedores.</td>
      <td style="padding: 0.5rem;">Escenario 1: DADO que Orion consume Google Maps y GPS de terceros con contratos OpenAPI versionados, CUANDO se despliega una nueva versión de integración, ENTONCES el 100% de pruebas de contrato debe aprobar y no debe haber rupturas backward-compatible en producción.<br><br>Escenario 2: DADO que un proveedor externo presenta indisponibilidad temporal, CUANDO se superan 5 errores consecutivos en 60 segundos, ENTONCES Orion debe activar modo degradado en menos de 2 segundos y mantener operativas las funciones internas críticas.<br><br>Escenario 3: DADO una actualización mayor de versión en un proveedor externo, CUANDO el equipo ejecuta pruebas de integración en preproducción, ENTONCES el tiempo de adaptación del conector no debe exceder 2 sprints.<br><br>Escenario 4: DADO una operación continua con integraciones activas, CUANDO se monitorean transacciones API por día, ENTONCES al menos el 99% de solicitudes válidas debe completarse exitosamente.</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">RNF02</td>
      <td style="padding: 0.5rem;">Disponibilidad</td>
      <td style="padding: 0.5rem;">Continuidad del Monitoreo Operativo</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero que el monitoreo de unidades esté disponible de forma continua, para supervisar la operación y responder a incidencias sin interrupciones críticas.</td>
      <td style="padding: 0.5rem;">Escenario 1: DADO un periodo mensual de operación 24/7, CUANDO se calcula la disponibilidad del módulo de monitoreo, ENTONCES debe alcanzar al menos 99.5% de uptime mensual.<br><br>Escenario 2: DADO una caída de un servicio de monitoreo en producción, CUANDO el sistema detecta el fallo por health checks, ENTONCES la recuperación automática debe restablecer el servicio en un RTO menor o igual a 5 minutos.<br><br>Escenario 3: DADO una falla de nodo en hora pico, CUANDO el balanceador redirige tráfico a réplicas saludables, ENTONCES la pérdida de solicitudes no debe superar el 1% durante el incidente.<br><br>Escenario 4: DADO una degradación parcial de infraestructura, CUANDO se activa el plan de contingencia, ENTONCES el sistema debe preservar las funciones críticas de monitoreo y alertas en menos de 3 minutos.</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">RNF03</td>
      <td style="padding: 0.5rem;">Performance</td>
      <td style="padding: 0.5rem;">Baja Latencia en Telemetría y Alertas</td>
      <td style="padding: 0.5rem;">Como operador de monitoreo, quiero recibir coordenadas y alertas en tiempo real con latencia mínima, para tomar decisiones operativas oportunas durante la ruta.</td>
      <td style="padding: 0.5rem;">Escenario 1: DADO una carga nominal de 2000 eventos de telemetría por minuto, CUANDO se mide el tiempo entre emisión de coordenada y visualización en mapa, ENTONCES la latencia p95 debe ser menor o igual a 3 segundos.<br><br>Escenario 2: DADO una alerta de incidente generada por una unidad activa, CUANDO el evento ingresa a la plataforma, ENTONCES la notificación al panel de control debe mostrarse en menos de 2 segundos en el 95% de casos.<br><br>Escenario 3: DADO un pico de carga de 5000 eventos por minuto durante 10 minutos, CUANDO se monitorea el procesamiento de cola, ENTONCES el sistema debe mantener una latencia p95 menor o igual a 5 segundos sin pérdida de eventos.<br><br>Escenario 4: DADO una versión candidata a producción, CUANDO se ejecuta una prueba de stress en CI/CD, ENTONCES el throughput mínimo debe sostener 300 requests por segundo con tasa de error menor al 1%.</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">RNF04</td>
      <td style="padding: 0.5rem;">Seguridad</td>
      <td style="padding: 0.5rem;">Protección de Datos Sensibles y Accesos</td>
      <td style="padding: 0.5rem;">Como administrador de seguridad, quiero proteger los datos sensibles de ubicación y controlar accesos por roles, para prevenir fugas de información y accesos no autorizados.</td>
      <td style="padding: 0.5rem;">Escenario 1: DADO usuarios autenticados mediante JWT/OAuth con roles definidos, CUANDO intentan acceder a un recurso fuera de su perfil, ENTONCES el sistema debe denegar el acceso con código 403 en el 100% de solicitudes no autorizadas.<br><br>Escenario 2: DADO el flujo de transmisión y almacenamiento de coordenadas de ubicación, CUANDO se ejecutan auditorías de seguridad trimestrales, ENTONCES el 100% de datos sensibles debe mantenerse cifrado en tránsito (TLS 1.2+) y en reposo (AES-256).<br><br>Escenario 3: DADO una sesión autenticada con token JWT, CUANDO el token expira o es inválido, ENTONCES el sistema debe rechazar la solicitud con código 401 en menos de 500 ms.<br><br>Escenario 4: DADO un intento de fuerza bruta sobre autenticación, CUANDO se superan 5 intentos fallidos en 10 minutos por usuario, ENTONCES la cuenta debe bloquearse temporalmente por 15 minutos y generar una alerta de seguridad.</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">RNF05</td>
      <td style="padding: 0.5rem;">Usabilidad</td>
      <td style="padding: 0.5rem;">Operación Simple para Conductores con Modo Offline</td>
      <td style="padding: 0.5rem;">Como conductor de flota, quiero usar la app de forma simple incluso sin conectividad, para registrar eventos y continuar mi operación sin bloquear mi jornada.</td>
      <td style="padding: 0.5rem;">Escenario 1: DADO un conductor en zona de baja conectividad, CUANDO registra un incidente o actualización de estado, ENTONCES la app debe guardar la acción offline en menos de 1 segundo y confirmar visualmente el registro local.<br><br>Escenario 2: DADO una cola de eventos almacenados offline, CUANDO se recupera la conectividad, ENTONCES la app debe sincronizar al menos el 95% de eventos pendientes en menos de 60 segundos sin duplicar registros.<br><br>Escenario 3: DADO un conductor que inicia jornada por primera vez, CUANDO completa el flujo principal de registro y reporte, ENTONCES debe finalizarlo en menos de 3 minutos sin asistencia externa en al menos el 90% de pruebas de usabilidad.<br><br>Escenario 4: DADO el uso continuo de la app en ruta, CUANDO el conductor ejecuta acciones frecuentes (reportar incidencia, confirmar estado, revisar ruta), ENTONCES cada acción debe completarse en un maximo de 3 toques en el 95% de los casos.</td>
    </tr>
  </tbody>
</table>

<h2 id="33-impact-map">3.3 Impact Map</h2>

<p align="center">
  <img src="assets/chapter-iii/Impact%20map%20GosLogic.png"
  alt="TOBE" style="width: 600px;"/>
</p>

<h2 id="34-product-backlog">3.4. Product Backlog.</h2>

<p>En esta sección se presenta el Product Backlog priorizado de Orion, organizado a partir de las User Stories identificadas para el sistema. Cada elemento incluye su orden de prioridad, identificador, título, descripción y estimación en Story Points.</p>

<table border="1" style="border-collapse: collapse; width: 100%; font-size: 0.95rem;">
  <thead>
    <tr>
      <th style="padding: 0.5rem;">Orden</th>
      <th style="padding: 0.5rem;">User Story ID</th>
      <th style="padding: 0.5rem;">Título</th>
      <th style="padding: 0.5rem;">Descripción</th>
      <th style="padding: 0.5rem;">Story Points</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 0.5rem;">1</td>
      <td style="padding: 0.5rem;">US01</td>
      <td style="padding: 0.5rem;">Configuración de Tenant</td>
      <td style="padding: 0.5rem;">Como administrador del sistema, quiero crear perfiles de empresa únicos, para que cada cliente tenga su propio espacio de trabajo aislado.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">2</td>
      <td style="padding: 0.5rem;">US04</td>
      <td style="padding: 0.5rem;">Autenticación JWT</td>
      <td style="padding: 0.5rem;">Como gestor, quiero acceder mediante tokens JWT, para asegurar autenticación robusta en el sistema.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">3</td>
      <td style="padding: 0.5rem;">US02</td>
      <td style="padding: 0.5rem;">Aislamiento de Datos</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero que mis datos de conductores y rutas sean invisibles para otras empresas, para garantizar la privacidad comercial.</td>
      <td style="padding: 0.5rem;">8</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">4</td>
      <td style="padding: 0.5rem;">US07</td>
      <td style="padding: 0.5rem;">Filtro Obligatorio por TenantId</td>
      <td style="padding: 0.5rem;">Como arquitecto, quiero que toda consulta a BD incluya TenantId, para asegurar 0% de fuga entre empresas.</td>
      <td style="padding: 0.5rem;">8</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">5</td>
      <td style="padding: 0.5rem;">US03</td>
      <td style="padding: 0.5rem;">Gestión de Usuarios y Roles</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero invitar usuarios con roles específicos, para delegar la supervisión de la flota.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">6</td>
      <td style="padding: 0.5rem;">US05</td>
      <td style="padding: 0.5rem;">Expiración de Sesión</td>
      <td style="padding: 0.5rem;">Como gestor, quiero que la sesión expire automáticamente tras inactividad, para reducir el riesgo de acceso no autorizado.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">7</td>
      <td style="padding: 0.5rem;">US06</td>
      <td style="padding: 0.5rem;">Cifrado HTTPS de Telemetría</td>
      <td style="padding: 0.5rem;">Como administrador, quiero que toda la telemetría se transmita vía HTTPS, para evitar interceptación de datos.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">8</td>
      <td style="padding: 0.5rem;">US15</td>
      <td style="padding: 0.5rem;">Asignación Dinámica</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero asignar conductores a vehículos y rutas específicas según la demanda del día.</td>
      <td style="padding: 0.5rem;">8</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">9</td>
      <td style="padding: 0.5rem;">US16</td>
      <td style="padding: 0.5rem;">Disponibilidad de Personal</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero ver quién está en turno activo, para no sobrepasar las horas permitidas de manejo.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">10</td>
      <td style="padding: 0.5rem;">US18</td>
      <td style="padding: 0.5rem;">Recepción de Horarios</td>
      <td style="padding: 0.5rem;">Como conductor, quiero ver mi cronograma diario en el móvil, para saber qué unidad debo operar.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">11</td>
      <td style="padding: 0.5rem;">US17</td>
      <td style="padding: 0.5rem;">Reporte de Jornada</td>
      <td style="padding: 0.5rem;">Como conductor, quiero marcar inicio y fin de jornada desde la app, para que mi tiempo laborado quede registrado.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">12</td>
      <td style="padding: 0.5rem;">US08</td>
      <td style="padding: 0.5rem;">Visualización en Mapa</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero ver la ubicación en tiempo real de mis vehículos, para optimizar la logística.</td>
      <td style="padding: 0.5rem;">8</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">13</td>
      <td style="padding: 0.5rem;">US09</td>
      <td style="padding: 0.5rem;">Historial de Rutas</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero consultar el recorrido histórico de una unidad, para verificar el cumplimiento de las rutas.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">14</td>
      <td style="padding: 0.5rem;">US10</td>
      <td style="padding: 0.5rem;">Gestión de Geocercas</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero definir zonas permitidas, para recibir alertas cuando un vehículo salga del perímetro autorizado.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">15</td>
      <td style="padding: 0.5rem;">US11</td>
      <td style="padding: 0.5rem;">Alertas por Geocerca</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero recibir alertas si un vehículo sale del perímetro autorizado, para actuar oportunamente.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">16</td>
      <td style="padding: 0.5rem;">US12</td>
      <td style="padding: 0.5rem;">Alertas de Kilometraje</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero recibir alertas automáticas de cambio de aceite, para evitar daños mecánicos por exceso de uso.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">17</td>
      <td style="padding: 0.5rem;">US13</td>
      <td style="padding: 0.5rem;">Registro de Activos</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero registrar el estado de neumáticos y frenos, para proyectar gastos de renovación anual.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">18</td>
      <td style="padding: 0.5rem;">US14</td>
      <td style="padding: 0.5rem;">Control de Revisiones Técnicas</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero programar revisiones legales, para evitar multas por documentos vencidos.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">19</td>
      <td style="padding: 0.5rem;">US19</td>
      <td style="padding: 0.5rem;">Reporte de Incidentes</td>
      <td style="padding: 0.5rem;">Como conductor, quiero enviar fotos de fallas mecánicas desde la app, para que el gestor programe el taller de inmediato.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">20</td>
      <td style="padding: 0.5rem;">US20</td>
      <td style="padding: 0.5rem;">Botón de Pánico</td>
      <td style="padding: 0.5rem;">Como conductor, quiero activar una alerta de emergencia, para que la central reciba mi ubicación exacta al instante.</td>
      <td style="padding: 0.5rem;">8</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">21</td>
      <td style="padding: 0.5rem;">US21</td>
      <td style="padding: 0.5rem;">Persistencia Local Offline</td>
      <td style="padding: 0.5rem;">Como conductor, quiero que la app móvil guarde eventos offline en SQLite, para garantizar la experiencia en zonas sin señal.</td>
      <td style="padding: 0.5rem;">8</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">22</td>
      <td style="padding: 0.5rem;">US22</td>
      <td style="padding: 0.5rem;">Sincronización Inteligente</td>
      <td style="padding: 0.5rem;">Como conductor, quiero que la app sincronice automáticamente los datos pendientes al recuperar señal, para no perder información registrada en modo offline.</td>
      <td style="padding: 0.5rem;">8</td>
    </tr>
  </tbody>
</table>