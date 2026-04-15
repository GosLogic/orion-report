# Capítulo III: Requirements Specification

Los `id` coinciden con el índice de `00-introduction.md`.

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

<p>En esta sección se presentan las épicas del producto Orion, redactadas para organizar los requisitos funcionales y no funcionales que guían el alcance del proyecto.</p>

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
    <tr>
      <td style="padding: 0.5rem;">E06</td>
      <td style="padding: 0.5rem;">Resiliencia y Continuidad</td>
      <td style="padding: 0.5rem;">Como administrador de infraestructura, quiero que el sistema tolere fallos y se recupere automáticamente, para asegurar continuidad del servicio sin interrupciones críticas.</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">E07</td>
      <td style="padding: 0.5rem;">Desempeño y Escalabilidad</td>
      <td style="padding: 0.5rem;">Como responsable técnico, quiero mantener baja latencia y escalar la plataforma ante mayor carga, para sostener el rendimiento con crecimiento de usuarios y eventos.</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">E08</td>
      <td style="padding: 0.5rem;">Calidad e Integración</td>
      <td style="padding: 0.5rem;">Como equipo de desarrollo, quiero contar con pruebas automatizadas y APIs estandarizadas, para facilitar mantenimiento e integración con terceros.</td>
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
    <tr>
      <td style="padding: 0.5rem;">US23</td>
      <td style="padding: 0.5rem;">Circuit Breaker</td>
      <td style="padding: 0.5rem;">Como gestor, quiero que el sistema active un Circuit Breaker si Google Maps falla, para no bloquear la operación.</td>
      <td style="padding: 0.5rem;">Escenario 1: Abrir circuito por fallas<br>DADO fallas consecutivas del proveedor de mapas<br>CUANDO supera el umbral configurado<br>ENTONCES el sistema debe abrir el Circuit Breaker<br><br>Escenario 2: Operar en modo degradado<br>DADO circuito abierto<br>CUANDO se solicitan funciones dependientes del proveedor<br>ENTONCES el sistema debe responder con fallback sin bloquear operación<br><br>Escenario 3: Intentar recuperación controlada<br>DADO cumplido el tiempo de enfriamiento<br>CUANDO se ejecuta una prueba al proveedor<br>ENTONCES el circuito debe pasar a estado half-open<br><br>Escenario 4: Cerrar circuito por estabilidad<br>DADO respuestas exitosas en estado half-open<br>CUANDO se cumple la política de recuperación<br>ENTONCES el circuito debe volver a estado cerrado</td>
      <td style="padding: 0.5rem;">E06</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US24</td>
      <td style="padding: 0.5rem;">Recuperación ante Caídas</td>
      <td style="padding: 0.5rem;">Como administrador, quiero que el sistema autorrecupere microservicios caídos, para restaurar la operación en el menor tiempo posible.</td>
      <td style="padding: 0.5rem;">Escenario 1: Detectar servicio no saludable<br>DADO un microservicio con fallo<br>CUANDO el orquestador ejecuta healthcheck<br>ENTONCES debe identificarlo como no saludable<br><br>Escenario 2: Ejecutar autorecuperación<br>DADO un servicio no saludable<br>CUANDO se activa la política de recuperación<br>ENTONCES el sistema debe reiniciarlo automáticamente<br><br>Escenario 3: Alertar fallo persistente<br>DADO múltiples reinicios fallidos<br>CUANDO se supera el umbral definido<br>ENTONCES el sistema debe generar alerta crítica al equipo técnico</td>
      <td style="padding: 0.5rem;">E06</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US25</td>
      <td style="padding: 0.5rem;">Latencia de Telemetría GPS</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero que la telemetría GPS se procese y visualice con baja latencia, para tomar decisiones operativas en tiempo real.</td>
      <td style="padding: 0.5rem;">Escenario 1: Medir latencia de punta a punta<br>DADO operación en condiciones nominales<br>CUANDO se mide el tiempo entre la emisión GPS y su visualización en el mapa<br>ENTONCES la latencia p95 debe ser menor a 3 segundos<br><br>Escenario 2: Alertar degradación de rendimiento<br>DADO que la latencia supera el umbral definido<br>CUANDO se ejecuta el monitoreo técnico<br>ENTONCES el sistema debe generar una alerta de rendimiento<br><br>Escenario 3: Priorizar procesamiento de eventos recientes<br>DADO una alta tasa de eventos GPS entrantes<br>CUANDO el sistema procesa la cola de telemetría<br>ENTONCES debe priorizar los eventos más recientes para mantener frescura en el mapa<br><br>Escenario 4: Visualizar métricas históricas<br>DADO que existen mediciones de rendimiento almacenadas<br>CUANDO el equipo técnico consulta el panel de métricas<br>ENTONCES debe visualizar tendencia de latencia por intervalo de tiempo<br><br>Escenario 5: Bloquear release por incumplimiento de latencia<br>DADO que la validación de rendimiento falla en CI<br>CUANDO la latencia no cumple el umbral objetivo<br>ENTONCES el pipeline debe marcar el despliegue como no aprobado</td>
      <td style="padding: 0.5rem;">E07</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US26</td>
      <td style="padding: 0.5rem;">Autoescalado Horizontal de Servicios</td>
      <td style="padding: 0.5rem;">Como administrador de plataforma, quiero escalar horizontalmente los servicios ante picos de tráfico, para mantener estabilidad y continuidad del sistema.</td>
      <td style="padding: 0.5rem;">Escenario 1: Escalar ante incremento de carga<br>DADO una carga superior al umbral de operación normal<br>CUANDO el uso promedio de CPU supera el límite configurado<br>ENTONCES el orquestador debe crear nuevas réplicas automáticamente<br><br>Escenario 2: Mantener servicio durante el escalado<br>DADO que se activó el escalamiento<br>CUANDO los usuarios continúan operando<br>ENTONCES el sistema debe mantener disponibilidad sin interrupciones críticas<br><br>Escenario 3: Liberar recursos cuando baja la demanda<br>DADO que el tráfico vuelve a niveles normales<br>CUANDO el uso de recursos se estabiliza<br>ENTONCES el sistema debe reducir réplicas de forma controlada para optimizar costos</td>
      <td style="padding: 0.5rem;">E07</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US27</td>
      <td style="padding: 0.5rem;">Cobertura Mínima de Pruebas</td>
      <td style="padding: 0.5rem;">Como equipo de QA, quiero validar una cobertura mínima automatizada, para asegurar calidad antes de cada despliegue.</td>
      <td style="padding: 0.5rem;">Escenario 1: Ejecutar pruebas en pipeline<br>DADO que se inicia una ejecución de CI<br>CUANDO corren las pruebas unitarias e integración<br>ENTONCES el sistema debe generar reporte de cobertura automáticamente<br><br>Escenario 2: Bloquear despliegue por baja cobertura<br>DADO que la cobertura global es menor al 80%<br>CUANDO finaliza la validación de calidad<br>ENTONCES el pipeline debe marcar la build como fallida</td>
      <td style="padding: 0.5rem;">E08</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">US28</td>
      <td style="padding: 0.5rem;">API REST Estandarizada para Integración</td>
      <td style="padding: 0.5rem;">Como integrador externo, quiero consumir APIs REST documentadas, para integrar sistemas de terceros en menor tiempo y con menos errores.</td>
      <td style="padding: 0.5rem;">Escenario 1: Publicar contrato API<br>DADO que existe un módulo expuesto a terceros<br>CUANDO el equipo publica su especificación OpenAPI<br>ENTONCES los endpoints, esquemas y códigos de respuesta deben quedar documentados<br><br>Escenario 2: Validar autenticación y consumo<br>DADO un tercero con credenciales válidas<br>CUANDO consume los endpoints principales<br>ENTONCES el sistema debe responder según contrato y políticas de seguridad<br><br>Escenario 3: Detectar cambios incompatibles<br>DADO una nueva versión de API<br>CUANDO se ejecutan pruebas de contrato<br>ENTONCES el sistema debe alertar si existe ruptura de compatibilidad con consumidores actuales</td>
      <td style="padding: 0.5rem;">E08</td>
    </tr>

    <tr>
  <td style="padding: 0.5rem;">US29</td>
  <td style="padding: 0.5rem;">Historial de Mantenimiento por Vehículo</td>
  <td style="padding: 0.5rem;">Como gestor de flota, quiero consultar el historial de mantenimientos de cada vehículo, para evaluar su estado y planificar intervenciones futuras.</td>
  <td style="padding: 0.5rem;">Escenario 1: Consultar historial existente<br>DADO que el gestor selecciona un vehículo con mantenimientos registrados<br>CUANDO accede a la sección de historial<br>ENTONCES el sistema debe mostrar la lista cronológica de mantenimientos realizados<br><br>Escenario 2: Consultar vehículo sin historial<br>DADO que el gestor selecciona un vehículo sin mantenimientos registrados<br>CUANDO accede a la sección de historial<br>ENTONCES el sistema debe informar que no existen registros previos</td>
  <td style="padding: 0.5rem;">E03</td>
</tr>

<tr>
  <td style="padding: 0.5rem;">US30</td>
  <td style="padding: 0.5rem;">Calendario de Mantenimientos</td>
  <td style="padding: 0.5rem;">Como gestor de flota, quiero ver un calendario con los mantenimientos próximos y vencidos, para organizar mejor la disponibilidad de la flota.</td>
  <td style="padding: 0.5rem;">Escenario 1: Visualizar mantenimientos programados<br>DADO que existen mantenimientos planificados para distintas unidades<br>CUANDO el gestor abre el calendario<br>ENTONCES el sistema debe mostrar los eventos según su fecha programada<br><br>Escenario 2: Resaltar mantenimientos vencidos<br>DADO que existen mantenimientos fuera de fecha<br>CUANDO el gestor revisa el calendario<br>ENTONCES el sistema debe destacarlos como vencidos o atrasados</td>
  <td style="padding: 0.5rem;">E03</td>
</tr>

<tr>
  <td style="padding: 0.5rem;">US31</td>
  <td style="padding: 0.5rem;">Estado General de Salud de la Flota</td>
  <td style="padding: 0.5rem;">Como gestor de flota, quiero visualizar un resumen del estado técnico de todas las unidades, para identificar rápidamente las más críticas.</td>
  <td style="padding: 0.5rem;">Escenario 1: Ver resumen general<br>DADO que existen vehículos registrados en la plataforma<br>CUANDO el gestor accede al panel de salud de flota<br>ENTONCES el sistema debe mostrar el estado general de cada unidad<br><br>Escenario 2: Identificar unidades críticas<br>DADO que algunas unidades presentan alertas activas o fallas pendientes<br>CUANDO el gestor revisa el panel<br>ENTONCES el sistema debe marcar esas unidades con mayor prioridad o criticidad</td>
  <td style="padding: 0.5rem;">E03</td>
</tr>

<tr>
  <td style="padding: 0.5rem;">US32</td>
  <td style="padding: 0.5rem;">Confirmación de Mantenimiento Realizado</td>
  <td style="padding: 0.5rem;">Como gestor de flota, quiero registrar cuando un mantenimiento fue completado, para reiniciar el ciclo preventivo correctamente.</td>
  <td style="padding: 0.5rem;">Escenario 1: Registrar mantenimiento completado<br>DADO que una unidad tiene un mantenimiento pendiente<br>CUANDO el gestor registra que el servicio fue realizado<br>ENTONCES el sistema debe actualizar el estado a completado<br><br>Escenario 2: Reiniciar ciclo preventivo<br>DADO que el mantenimiento fue confirmado correctamente<br>CUANDO el sistema guarda el registro<br>ENTONCES debe reiniciar el conteo de kilometraje o tiempo asociado a ese mantenimiento</td>
  <td style="padding: 0.5rem;">E03</td>
</tr>

<tr>
  <td style="padding: 0.5rem;">US33</td>
  <td style="padding: 0.5rem;">Dashboard de Mantenimiento</td>
  <td style="padding: 0.5rem;">Como gestor de flota, quiero tener un dashboard con alertas, próximos servicios e historial resumido, para tomar decisiones rápidas sobre el mantenimiento.</td>
  <td style="padding: 0.5rem;">Escenario 1: Visualizar dashboard consolidado<br>DADO que existen unidades y mantenimientos registrados<br>CUANDO el gestor ingresa al dashboard de mantenimiento<br>ENTONCES el sistema debe mostrar alertas, servicios próximos e indicadores resumidos<br><br>Escenario 2: Actualizar dashboard con nuevos eventos<br>DADO que se registra una nueva alerta o mantenimiento<br>CUANDO el sistema procesa el cambio<br>ENTONCES el dashboard debe reflejar la información actualizada</td>
  <td style="padding: 0.5rem;">E03</td>
</tr>

<tr>
  <td style="padding: 0.5rem;">US34</td>
  <td style="padding: 0.5rem;">Priorización de Unidades Críticas</td>
  <td style="padding: 0.5rem;">Como gestor de flota, quiero ordenar vehículos por nivel de riesgo mecánico, para atender primero los casos más urgentes.</td>
  <td style="padding: 0.5rem;">Escenario 1: Ordenar por criticidad<br>DADO que existen unidades con distintos niveles de riesgo<br>CUANDO el gestor aplica el orden por criticidad<br>ENTONCES el sistema debe mostrar primero las unidades más críticas<br><br>Escenario 2: Recalcular prioridad<br>DADO que una unidad cambia de estado técnico<br>CUANDO el sistema actualiza su condición<br>ENTONCES debe recalcular su nivel de prioridad dentro de la lista</td>
  <td style="padding: 0.5rem;">E03</td>
</tr>

<tr>
  <td style="padding: 0.5rem;">US35</td>
  <td style="padding: 0.5rem;">Notificaciones Operativas al Conductor</td>
  <td style="padding: 0.5rem;">Como conductor, quiero recibir notificaciones operativas en la app, para conocer cambios de ruta, horarios o instrucciones sin depender de llamadas.</td>
  <td style="padding: 0.5rem;">Escenario 1: Recibir cambio de ruta<br>DADO que el gestor modifica una ruta asignada<br>CUANDO el cambio es confirmado en el sistema<br>ENTONCES la app del conductor debe mostrar una notificación operativa<br><br>Escenario 2: Recibir cambio de horario<br>DADO que el gestor actualiza el horario de una asignación<br>CUANDO el sistema procesa la actualización<br>ENTONCES el conductor debe recibir la nueva información en la app</td>
  <td style="padding: 0.5rem;">E05</td>
</tr>

<tr>
  <td style="padding: 0.5rem;">US36</td>
  <td style="padding: 0.5rem;">Confirmación de Ruta Asignada</td>
  <td style="padding: 0.5rem;">Como conductor, quiero confirmar que recibí y entendí la ruta asignada, para evitar errores de coordinación al iniciar la jornada.</td>
  <td style="padding: 0.5rem;">Escenario 1: Confirmar recepción de ruta<br>DADO que el conductor tiene una nueva ruta asignada<br>CUANDO accede al detalle y presiona confirmar<br>ENTONCES el sistema debe registrar la confirmación de recepción<br><br>Escenario 2: Visualizar ruta pendiente de confirmar<br>DADO que existe una ruta aún no confirmada<br>CUANDO el conductor ingresa a la app<br>ENTONCES el sistema debe mostrar la asignación como pendiente de confirmación</td>
  <td style="padding: 0.5rem;">E05</td>
</tr>

<tr>
  <td style="padding: 0.5rem;">US37</td>
  <td style="padding: 0.5rem;">Visualización Detallada de Ruta</td>
  <td style="padding: 0.5rem;">Como conductor, quiero ver los puntos de parada y observaciones de mi ruta, para ejecutarla correctamente durante el día.</td>
  <td style="padding: 0.5rem;">Escenario 1: Ver detalle completo de ruta<br>DADO que el conductor tiene una ruta asignada<br>CUANDO abre el detalle de la ruta<br>ENTONCES el sistema debe mostrar paradas, horarios y observaciones asociadas<br><br>Escenario 2: Mostrar ruta sin observaciones<br>DADO que la ruta no contiene observaciones adicionales<br>CUANDO el conductor consulta el detalle<br>ENTONCES el sistema debe mostrar la información disponible sin errores</td>
  <td style="padding: 0.5rem;">E05</td>
</tr>

<tr>
  <td style="padding: 0.5rem;">US38</td>
  <td style="padding: 0.5rem;">Registro de Entrega o Parada Completada</td>
  <td style="padding: 0.5rem;">Como conductor, quiero marcar una parada o entrega como completada, para mantener actualizado el avance de mi ruta.</td>
  <td style="padding: 0.5rem;">Escenario 1: Marcar parada completada<br>DADO que el conductor se encuentra en una parada activa<br>CUANDO presiona la opción de completar<br>ENTONCES el sistema debe registrar la parada como realizada<br><br>Escenario 2: Reflejar avance de ruta<br>DADO que una parada fue completada correctamente<br>CUANDO el sistema actualiza el estado<br>ENTONCES debe reflejar el avance acumulado de la ruta</td>
  <td style="padding: 0.5rem;">E05</td>
</tr>

<tr>
  <td style="padding: 0.5rem;">US39</td>
  <td style="padding: 0.5rem;">Check-in en Punto de Control</td>
  <td style="padding: 0.5rem;">Como conductor, quiero registrar mi llegada a puntos clave de la ruta, para dejar evidencia de cumplimiento operativo.</td>
  <td style="padding: 0.5rem;">Escenario 1: Registrar llegada a punto de control<br>DADO que el conductor llega a un punto de control definido<br>CUANDO realiza el check-in desde la app<br>ENTONCES el sistema debe guardar fecha, hora y ubicación del evento<br><br>Escenario 2: Evitar check-in fuera de contexto<br>DADO que el conductor intenta registrar un check-in sin punto asignado<br>CUANDO ejecuta la acción<br>ENTONCES el sistema debe bloquear el registro o informar que no corresponde</td>
  <td style="padding: 0.5rem;">E05</td>
</tr>

<tr>
  <td style="padding: 0.5rem;">US40</td>
  <td style="padding: 0.5rem;">Navegación Asistida en Ruta</td>
  <td style="padding: 0.5rem;">Como conductor, quiero abrir navegación guiada desde la app, para seguir la ruta asignada con mayor facilidad.</td>
  <td style="padding: 0.5rem;">Escenario 1: Iniciar navegación<br>DADO que el conductor tiene una ruta asignada<br>CUANDO presiona la opción de navegar<br>ENTONCES la app debe abrir la navegación hacia el siguiente punto de la ruta<br><br>Escenario 2: Navegación sin ruta asignada<br>DADO que el conductor no tiene una ruta activa<br>CUANDO intenta usar la función de navegación<br>ENTONCES el sistema debe informar que no existe una ruta disponible</td>
  <td style="padding: 0.5rem;">E05</td>
</tr>

<tr>
  <td style="padding: 0.5rem;">US41</td>
  <td style="padding: 0.5rem;">Reasignación por Contingencia</td>
  <td style="padding: 0.5rem;">Como gestor de flota, quiero reasignar rápidamente una ruta o unidad ante una incidencia, para mantener la continuidad de la operación.</td>
  <td style="padding: 0.5rem;">Escenario 1: Reasignar ruta por incidencia<br>DADO que una unidad o conductor presenta una contingencia<br>CUANDO el gestor realiza una nueva asignación<br>ENTONCES el sistema debe actualizar la operación con el nuevo recurso<br><br>Escenario 2: Notificar reasignación<br>DADO que la reasignación fue completada<br>CUANDO el sistema guarda el cambio<br>ENTONCES debe notificar a los usuarios involucrados</td>
  <td style="padding: 0.5rem;">E04</td>
</tr>

<tr>
  <td style="padding: 0.5rem;">US42</td>
  <td style="padding: 0.5rem;">Vista de Cumplimiento de Despachos</td>
  <td style="padding: 0.5rem;">Como gestor de flota, quiero ver qué despachos están pendientes, en ruta o finalizados, para tener control del avance diario.</td>
  <td style="padding: 0.5rem;">Escenario 1: Visualizar estados de despacho<br>DADO que existen despachos programados en el día<br>CUANDO el gestor accede al panel operativo<br>ENTONCES el sistema debe mostrar el estado de cada despacho<br><br>Escenario 2: Actualizar estado en tiempo real<br>DADO que un despacho cambia de estado<br>CUANDO el sistema recibe la actualización<br>ENTONCES el panel debe reflejar el nuevo estado del despacho</td>
  <td style="padding: 0.5rem;">E04</td>
</tr>

<tr>
  <td style="padding: 0.5rem;">US43</td>
  <td style="padding: 0.5rem;">Búsqueda Rápida de Vehículo en Mapa</td>
  <td style="padding: 0.5rem;">Como gestor de flota, quiero buscar una unidad específica en el mapa, para consultar su situación sin revisar toda la flota.</td>
  <td style="padding: 0.5rem;">Escenario 1: Buscar unidad existente<br>DADO que el gestor conoce la placa o nombre de la unidad<br>CUANDO utiliza la función de búsqueda en el mapa<br>ENTONCES el sistema debe ubicar y resaltar el vehículo correspondiente<br><br>Escenario 2: Buscar unidad inexistente<br>DADO que el gestor ingresa un identificador no registrado<br>CUANDO ejecuta la búsqueda<br>ENTONCES el sistema debe informar que no se encontraron resultados</td>
  <td style="padding: 0.5rem;">E02</td>
</tr>

<tr>
  <td style="padding: 0.5rem;">US44</td>
  <td style="padding: 0.5rem;">Detalle de Evento Telemétrico</td>
  <td style="padding: 0.5rem;">Como gestor de flota, quiero ver el detalle de eventos telemétricos de una unidad, para analizar incidencias o comportamientos fuera de lo normal.</td>
  <td style="padding: 0.5rem;">Escenario 1: Consultar detalle de evento<br>DADO que una unidad generó eventos telemétricos registrados<br>CUANDO el gestor selecciona uno de ellos<br>ENTONCES el sistema debe mostrar hora, ubicación y tipo de evento<br><br>Escenario 2: Consultar unidad sin eventos<br>DADO que la unidad no tiene eventos en el rango seleccionado<br>CUANDO el gestor realiza la consulta<br>ENTONCES el sistema debe informar que no hay eventos disponibles</td>
  <td style="padding: 0.5rem;">E02</td>
</tr>

<tr>
  <td style="padding: 0.5rem;">US45</td>
  <td style="padding: 0.5rem;">Estado de Sincronización Offline</td>
  <td style="padding: 0.5rem;">Como conductor, quiero ver qué eventos siguen pendientes de sincronizar, para saber si mi información ya fue enviada correctamente.</td>
  <td style="padding: 0.5rem;">Escenario 1: Ver eventos pendientes<br>DADO que existen registros guardados localmente sin sincronizar<br>CUANDO el conductor revisa la cola de sincronización<br>ENTONCES la app debe mostrar la lista de eventos pendientes<br><br>Escenario 2: Actualizar estado tras sincronización<br>DADO que la conexión fue recuperada y los eventos fueron enviados<br>CUANDO la sincronización finaliza correctamente<br>ENTONCES la app debe actualizar el estado de esos eventos como sincronizados</td>
  <td style="padding: 0.5rem;">E05</td>
</tr>

<tr>
  <td style="padding: 0.5rem;">US46</td>
  <td style="padding: 0.5rem;">Auditoría de Accesos por Tenant</td>
  <td style="padding: 0.5rem;">Como administrador, quiero consultar un registro de accesos y acciones por tenant, para detectar comportamientos sospechosos y mantener trazabilidad.</td>
  <td style="padding: 0.5rem;">Escenario 1: Consultar auditoría de tenant<br>DADO que existen registros de actividad de un tenant<br>CUANDO el administrador accede al módulo de auditoría<br>ENTONCES el sistema debe mostrar accesos y acciones realizadas<br><br>Escenario 2: Filtrar auditoría por rango o usuario<br>DADO que el administrador necesita revisar un caso específico<br>CUANDO aplica filtros por fecha o usuario<br>ENTONCES el sistema debe mostrar solo los registros coincidentes</td>
  <td style="padding: 0.5rem;">E01</td>
</tr>

<tr>
  <td style="padding: 0.5rem;">US47</td>
  <td style="padding: 0.5rem;">Exportación de Reportes Operativos</td>
  <td style="padding: 0.5rem;">Como gestor de flota, quiero exportar reportes en PDF o Excel, para compartir información operativa con otras áreas de la empresa.</td>
  <td style="padding: 0.5rem;">Escenario 1: Exportar reporte en PDF<br>DADO que el gestor visualiza un reporte operativo<br>CUANDO selecciona la opción de exportar en PDF<br>ENTONCES el sistema debe generar el archivo correspondiente<br><br>Escenario 2: Exportar reporte en Excel<br>DADO que el gestor visualiza un reporte operativo<br>CUANDO selecciona la opción de exportar en Excel<br>ENTONCES el sistema debe descargar el archivo con los datos mostrados</td>
  <td style="padding: 0.5rem;">E08</td>
</tr>

<tr>
  <td style="padding: 0.5rem;">US48</td>
  <td style="padding: 0.5rem;">Versionado de API para Integraciones</td>
  <td style="padding: 0.5rem;">Como integrador externo, quiero consumir versiones estables de la API, para evitar fallos cuando el sistema evolucione.</td>
  <td style="padding: 0.5rem;">Escenario 1: Consumir versión vigente de API<br>DADO que existe una versión pública y estable de la API<br>CUANDO el integrador realiza una solicitud válida<br>ENTONCES el sistema debe responder según el contrato de esa versión<br><br>Escenario 2: Mantener compatibilidad entre versiones<br>DADO que se publica una nueva versión de la API<br>CUANDO un integrador sigue usando la versión anterior soportada<br>ENTONCES el sistema debe permitir su consumo sin romper la compatibilidad anunciada</td>
  <td style="padding: 0.5rem;">E08</td>
</tr>

  </tbody>
</table>

<h2 id="33-impact-map">3.3 Impact Map</h2>

<p align="center">
  <img src="assets/chapter-iii/Impact mapFinal.png"
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
      <td style="padding: 0.5rem;">US41</td>
      <td style="padding: 0.5rem;">Reasignación por Contingencia</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero reasignar rápidamente una ruta o unidad ante una incidencia, para mantener la continuidad de la operación.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">11</td>
      <td style="padding: 0.5rem;">US18</td>
      <td style="padding: 0.5rem;">Recepción de Horarios</td>
      <td style="padding: 0.5rem;">Como conductor, quiero ver mi cronograma diario en el móvil, para saber qué unidad debo operar.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">12</td>
      <td style="padding: 0.5rem;">US17</td>
      <td style="padding: 0.5rem;">Reporte de Jornada</td>
      <td style="padding: 0.5rem;">Como conductor, quiero marcar inicio y fin de jornada desde la app, para que mi tiempo laborado quede registrado.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">13</td>
      <td style="padding: 0.5rem;">US36</td>
      <td style="padding: 0.5rem;">Confirmación de Ruta Asignada</td>
      <td style="padding: 0.5rem;">Como conductor, quiero confirmar que recibí y entendí la ruta asignada, para evitar errores de coordinación al iniciar la jornada.</td>
      <td style="padding: 0.5rem;">2</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">14</td>
      <td style="padding: 0.5rem;">US37</td>
      <td style="padding: 0.5rem;">Visualización Detallada de Ruta</td>
      <td style="padding: 0.5rem;">Como conductor, quiero ver los puntos de parada y observaciones de mi ruta, para ejecutarla correctamente durante el día.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">15</td>
      <td style="padding: 0.5rem;">US35</td>
      <td style="padding: 0.5rem;">Notificaciones Operativas al Conductor</td>
      <td style="padding: 0.5rem;">Como conductor, quiero recibir notificaciones operativas en la app, para conocer cambios de ruta, horarios o instrucciones sin depender de llamadas.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">16</td>
      <td style="padding: 0.5rem;">US08</td>
      <td style="padding: 0.5rem;">Visualización en Mapa</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero ver la ubicación en tiempo real de mis vehículos, para optimizar la logística.</td>
      <td style="padding: 0.5rem;">8</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">17</td>
      <td style="padding: 0.5rem;">US43</td>
      <td style="padding: 0.5rem;">Búsqueda Rápida de Vehículo en Mapa</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero buscar una unidad específica en el mapa, para consultar su situación sin revisar toda la flota.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">18</td>
      <td style="padding: 0.5rem;">US09</td>
      <td style="padding: 0.5rem;">Historial de Rutas</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero consultar el recorrido histórico de una unidad, para verificar el cumplimiento de las rutas.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">19</td>
      <td style="padding: 0.5rem;">US42</td>
      <td style="padding: 0.5rem;">Vista de Cumplimiento de Despachos</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero ver qué despachos están pendientes, en ruta o finalizados, para tener control del avance diario.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">20</td>
      <td style="padding: 0.5rem;">US38</td>
      <td style="padding: 0.5rem;">Registro de Entrega o Parada Completada</td>
      <td style="padding: 0.5rem;">Como conductor, quiero marcar una parada o entrega como completada, para mantener actualizado el avance de mi ruta.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">21</td>
      <td style="padding: 0.5rem;">US39</td>
      <td style="padding: 0.5rem;">Check-in en Punto de Control</td>
      <td style="padding: 0.5rem;">Como conductor, quiero registrar mi llegada a puntos clave de la ruta, para dejar evidencia de cumplimiento operativo.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">22</td>
      <td style="padding: 0.5rem;">US40</td>
      <td style="padding: 0.5rem;">Navegación Asistida en Ruta</td>
      <td style="padding: 0.5rem;">Como conductor, quiero abrir navegación guiada desde la app, para seguir la ruta asignada con mayor facilidad.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">23</td>
      <td style="padding: 0.5rem;">US19</td>
      <td style="padding: 0.5rem;">Reporte de Incidentes</td>
      <td style="padding: 0.5rem;">Como conductor, quiero enviar fotos de fallas mecánicas desde la app, para que el gestor programe el taller de inmediato.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">24</td>
      <td style="padding: 0.5rem;">US20</td>
      <td style="padding: 0.5rem;">Botón de Pánico</td>
      <td style="padding: 0.5rem;">Como conductor, quiero activar una alerta de emergencia, para que la central reciba mi ubicación exacta al instante.</td>
      <td style="padding: 0.5rem;">8</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">25</td>
      <td style="padding: 0.5rem;">US21</td>
      <td style="padding: 0.5rem;">Persistencia Local Offline</td>
      <td style="padding: 0.5rem;">Como conductor, quiero que la app móvil guarde eventos offline en SQLite, para garantizar la experiencia en zonas sin señal.</td>
      <td style="padding: 0.5rem;">8</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">26</td>
      <td style="padding: 0.5rem;">US22</td>
      <td style="padding: 0.5rem;">Sincronización Inteligente</td>
      <td style="padding: 0.5rem;">Como conductor, quiero que la app sincronice automáticamente los datos pendientes al recuperar señal, para no perder información registrada en modo offline.</td>
      <td style="padding: 0.5rem;">8</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">27</td>
      <td style="padding: 0.5rem;">US45</td>
      <td style="padding: 0.5rem;">Estado de Sincronización Offline</td>
      <td style="padding: 0.5rem;">Como conductor, quiero ver qué eventos siguen pendientes de sincronizar, para saber si mi información ya fue enviada correctamente.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">28</td>
      <td style="padding: 0.5rem;">US10</td>
      <td style="padding: 0.5rem;">Gestión de Geocercas</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero definir zonas permitidas, para recibir alertas cuando un vehículo salga del perímetro autorizado.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">29</td>
      <td style="padding: 0.5rem;">US11</td>
      <td style="padding: 0.5rem;">Alertas por Geocerca</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero recibir alertas si un vehículo sale del perímetro autorizado, para actuar oportunamente.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">30</td>
      <td style="padding: 0.5rem;">US44</td>
      <td style="padding: 0.5rem;">Detalle de Evento Telemétrico</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero ver el detalle de eventos telemétricos de una unidad, para analizar incidencias o comportamientos fuera de lo normal.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">31</td>
      <td style="padding: 0.5rem;">US12</td>
      <td style="padding: 0.5rem;">Alertas de Kilometraje</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero recibir alertas automáticas de cambio de aceite, para evitar daños mecánicos por exceso de uso.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">32</td>
      <td style="padding: 0.5rem;">US13</td>
      <td style="padding: 0.5rem;">Registro de Activos</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero registrar el estado de neumáticos y frenos, para proyectar gastos de renovación anual.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">33</td>
      <td style="padding: 0.5rem;">US14</td>
      <td style="padding: 0.5rem;">Control de Revisiones Técnicas</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero programar revisiones legales, para evitar multas por documentos vencidos.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">34</td>
      <td style="padding: 0.5rem;">US29</td>
      <td style="padding: 0.5rem;">Historial de Mantenimiento por Vehículo</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero consultar el historial de mantenimientos de cada vehículo, para evaluar su estado y planificar intervenciones futuras.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">35</td>
      <td style="padding: 0.5rem;">US30</td>
      <td style="padding: 0.5rem;">Calendario de Mantenimientos</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero ver un calendario con los mantenimientos próximos y vencidos, para organizar mejor la disponibilidad de la flota.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">36</td>
      <td style="padding: 0.5rem;">US31</td>
      <td style="padding: 0.5rem;">Estado General de Salud de la Flota</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero visualizar un resumen del estado técnico de todas las unidades, para identificar rápidamente las más críticas.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">37</td>
      <td style="padding: 0.5rem;">US32</td>
      <td style="padding: 0.5rem;">Confirmación de Mantenimiento Realizado</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero registrar cuando un mantenimiento fue completado, para reiniciar el ciclo preventivo correctamente.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">38</td>
      <td style="padding: 0.5rem;">US33</td>
      <td style="padding: 0.5rem;">Dashboard de Mantenimiento</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero tener un dashboard con alertas, próximos servicios e historial resumido, para tomar decisiones rápidas sobre el mantenimiento.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">39</td>
      <td style="padding: 0.5rem;">US34</td>
      <td style="padding: 0.5rem;">Priorización de Unidades Críticas</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero ordenar vehículos por nivel de riesgo mecánico, para atender primero los casos más urgentes.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">40</td>
      <td style="padding: 0.5rem;">US23</td>
      <td style="padding: 0.5rem;">Circuit Breaker</td>
      <td style="padding: 0.5rem;">Como gestor, quiero que el sistema active un Circuit Breaker si Google Maps falla, para no bloquear la operación.</td>
      <td style="padding: 0.5rem;">8</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">41</td>
      <td style="padding: 0.5rem;">US24</td>
      <td style="padding: 0.5rem;">Recuperación ante Caídas</td>
      <td style="padding: 0.5rem;">Como administrador, quiero que el sistema autorrecupere microservicios caídos, para restaurar la operación en el menor tiempo posible.</td>
      <td style="padding: 0.5rem;">8</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">42</td>
      <td style="padding: 0.5rem;">US25</td>
      <td style="padding: 0.5rem;">Latencia de Telemetría GPS</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero que la telemetría GPS se procese y visualice con baja latencia, para tomar decisiones operativas en tiempo real.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">43</td>
      <td style="padding: 0.5rem;">US26</td>
      <td style="padding: 0.5rem;">Autoescalado Horizontal de Servicios</td>
      <td style="padding: 0.5rem;">Como administrador de plataforma, quiero escalar horizontalmente los servicios ante picos de tráfico, para mantener estabilidad y continuidad del sistema.</td>
      <td style="padding: 0.5rem;">8</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">44</td>
      <td style="padding: 0.5rem;">US27</td>
      <td style="padding: 0.5rem;">Cobertura Mínima de Pruebas</td>
      <td style="padding: 0.5rem;">Como equipo de QA, quiero validar una cobertura mínima automatizada, para asegurar calidad antes de cada despliegue.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">45</td>
      <td style="padding: 0.5rem;">US28</td>
      <td style="padding: 0.5rem;">API REST Estandarizada para Integración</td>
      <td style="padding: 0.5rem;">Como integrador externo, quiero consumir APIs REST documentadas, para integrar sistemas de terceros en menor tiempo y con menos errores.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">46</td>
      <td style="padding: 0.5rem;">US46</td>
      <td style="padding: 0.5rem;">Auditoría de Accesos por Tenant</td>
      <td style="padding: 0.5rem;">Como administrador, quiero consultar un registro de accesos y acciones por tenant, para detectar comportamientos sospechosos y mantener trazabilidad.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">47</td>
      <td style="padding: 0.5rem;">US47</td>
      <td style="padding: 0.5rem;">Exportación de Reportes Operativos</td>
      <td style="padding: 0.5rem;">Como gestor de flota, quiero exportar reportes en PDF o Excel, para compartir información operativa con otras áreas de la empresa.</td>
      <td style="padding: 0.5rem;">3</td>
    </tr>
    <tr>
      <td style="padding: 0.5rem;">48</td>
      <td style="padding: 0.5rem;">US48</td>
      <td style="padding: 0.5rem;">Versionado de API para Integraciones</td>
      <td style="padding: 0.5rem;">Como integrador externo, quiero consumir versiones estables de la API, para evitar fallos cuando el sistema evolucione.</td>
      <td style="padding: 0.5rem;">5</td>
    </tr>
  </tbody>
</table>