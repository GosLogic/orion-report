workspace "Orion - Fleet Management Platform" "C4 Architecture Model" {
    
    model {
        
        #Actores
        fleetManager = person "Gestor Flota" "Usuario administrativo que gestiona rutas y monitorea la flota en tiempo real"
        driver = person "Conductor" "Usuario en campo que conduce el vehículo y reporta su ubicación mediante GPS"
        
        # External Systems
        googleMapsAPI = softwareSystem "Google Maps API" "Sistema cartográfico de terceros para geocodificación inversa y consultas de mapas" {
            tags "External"
        }
        
        emailService = softwareSystem "SendGrid" "Servicio externo para el envío  de correos electrónicos transaccionales" {
            tags "External"
        }
        
        
        orion = softwareSystem "Orion" "Plataforma SaaS Cloud-Native y Multi-Tenant para gestión logística, ruteo y telemetría de flotas vehiculares con alta disponibilidad y performance" {
            tags "Orion"
            
            fleetManagerSPA = container "FleetManagerSPA" "Portal web para el Gestor de Flota con dashboards de monitoreo y gestión de rutas" "Single-Page Application (Angular)" {
                tags "Web"
            }
            
            mobileApp = container "MobileApp" "Aplicación nativa Offline-First para el Conductor con sincronización automática" "Flutter" {
                tags "Mobile"
            }
            
            loadBalancer = container "LoadBalancer" "Distribuye el tráfico entrante para garantizar alta disponibilidad mediante redundancia activa y health checks" "Load Balancer (NGINX/HAProxy)" {
                tags "Performance"
            }
            messageBroker = container "MessageBroker" "Encola masivamente eventos de telemetría GPS para introducir concurrencia y desacoplamiento" "ActiveMQ)" {
                tags "Performance"
            }
            
            apiGateway = container "ApiGateway" "Punto de entrada único que enruta requests, inyecta TenantId, rate limiting y autenticación" "API Gateway (Spring Cloud Gateway)" {
                tags "Gateway"
            }
            
            #  BASES DE DATOS 
            
            iamDB = container "IamDB" "Datos de usuarios y tenants" "PostgreSQL" { 
                tags "Database" 
            }
            fleetDB = container "FleetDB" "Inventario de vehículos y conductores con RLS" "PostgreSQL" { 
                tags "Database"
            }
            dispatchDB = container "DispatchDB" "Rutas y asignaciones de viajes" "PostgreSQL" { 
                tags "Database"
            }
            
            telemetryDB = container "TelemetryDB" "Histórico masivo de posiciones GPS" "TimescaleDB" { 
                tags "Database" 
            }
            maintenanceDB = container "MaintenanceDB" "Programas de salud y alertas preventivas" "PostgreSQL" { 
                tags "Database"
            }
            
            #Services
            
            iamService = container "Iam Service" "Gestiona la identidad, autenticación y el aislamiento lógico de los clientes SaaS (Multi-tenancy)" "Spring Boot" {
                tags "Service"
                
                # Componentes internos
                authController = component "AuthController" "Expone endpoints para login, registro y validación de tokens" "REST Controller"
                tenantController = component "TenantController" "Endpoints para el onboarding y gestión de empresas (Tenants)" "REST Controller"
                identityService = component "IdentityService" "Gestiona usuarios, roles y permisos dentro de cada tenant" "Service Layer"
                tenantService = component "TenantService" "Lógica para la creación y configuración de espacios aislados" "Service Layer"
                tokenProvider = component "TokenProvider" "Genera y valida JWT inyectando el TenantId y claims de seguridad" "Security Component"
                iamRepository = component "IamRepository" "Acceso a datos de identidades y configuración de tenants" "Data Access"

                # Relaciones internas
                authController -> identityService "Solicita validación de credenciales"
                authController -> tokenProvider "Solicita generación de JWT con TenantId"
                tenantController -> tenantService "Inicia proceso de onboarding"
                
                identityService -> iamRepository "Consulta/Persiste usuarios"
                tenantService -> iamRepository "Persiste configuración de empresa"
                
                iamRepository -> iamDB "Operaciones CRUD" "JDBC/TypeORM"
            }
            
            fleetService = container "FleetService" "Gestión del inventario de activos: vehículos y conductores" "Spring Boot" {
                tags "Service"

                fleetController = component "FleetController" "CRUD de vehículos y conductores" "REST Controller"
                assetManagerService = component "AssetManagerService" "Lógica de alta, baja y estado de disponibilidad de activos" "Service Layer"
                #reacciona a otros servicios
                assetStatusSynchronizer = component "AssetStatusSynchronizer" "Sincroniza el estado (disponible/ocupado/taller) basado en eventos externos" "Event Handler"
                fleetRepository = component "FleetRepository" "Persistencia de activos en FleetDB" "Data Access"
                # Relaciones internas
                fleetController -> assetManagerService "Gestiona flota"
                assetManagerService -> fleetRepository "Persiste activos"
                assetStatusSynchronizer -> assetManagerService "Actualiza estados por eventos"
                fleetRepository -> fleetDB "JDBC"
            }
            
            dispatchService = container "DispatchService" "Planificación, optimización y asignación de viajes logísticos" "Spring Boot" { 
                tags "Service"

                dispatchController = component "DispatchController" "Expone endpoints para la creación, consulta y gestión del ciclo de vida de los viajes" "REST Controller"
                routingEngine = component "RoutingEngine" "Algoritmo encargado de calcular las rutas óptimas basándose en tiempo, distancia y tráfico" "Business Component"
                dispatchBusinessService = component "DispatchBusinessService" "Orquesta la lógica de asignación de viajes, vinculando conductores, vehículos y rutas" "Service Layer"
                fleetClient = component "FleetClient" "Cliente API interno para consultar disponibilidad y detalles de activos al FleetService" "Internal API Client"
                dispatchRepository = component "DispatchRepository" "Gestiona la persistencia de los planes de ruta y estados de viaje en DispatchDB" "Data Access"

                # Relaciones internas
                dispatchController -> dispatchBusinessService "Solicita gestión de viajes"
                dispatchBusinessService -> routingEngine "Solicita cálculo de ruta óptima"
                 dispatchBusinessService -> fleetClient "Consulta activos disponibles para asignar"
                dispatchBusinessService -> dispatchRepository "Persiste el viaje y la ruta"
                
                dispatchRepository -> dispatchDB "Operaciones CRUD" "JBDC"
            }
            
            telemetryService = container "TelemetryService" "Procesa ingesta masiva de GPS, integración cartográfica y análisis de geocercas en tiempo real" "Spring Boot " {
                tags "Service"

                telemetryMessageListener = component "TelemetryMessageListener" "Suscriptor encargado de consumir ráfagas de coordenadas desde el Message Broker" "Event Handler"
                telemetryController = component "TelemetryController" "Endpoints para consultas de última ubicación y recorridos históricos" "REST Controller"
                telemetryBusinessService = component "TelemetryBusinessService" "Lógica de validación, cálculo de distancias, excesos de velocidad y detección de entrada/salida de geocercas" "Service Layer"
                geoFenceManager = component "GeoFenceManager" "Componente especializado en el procesamiento espacial y validación de perímetros permitidos" "Business Component"
                telemetryRepository = component "TelemetryRepository" "Gestiona la persistencia optimizada hacia la base de datos de series temporales (TelemetryDB)" "Data Access"
                mapIntegrationAdapter = component "MapIntegrationAdapter" "Adaptador ACL para Google Maps con resiliencia basada en Circuit Breaker" "Anti-Corruption Layer"

                # Relaciones internas
                telemetryMessageListener -> telemetryBusinessService "Envía coordenadas para procesamiento"
                telemetryController -> telemetryBusinessService "Solicita datos de ubicación"
                telemetryBusinessService -> geoFenceManager "Valida posición contra geocercas"
                telemetryBusinessService -> telemetryRepository "Persiste histórico de posiciones"
                telemetryBusinessService -> mapIntegrationAdapter "Solicita geocodificación inversa"
                telemetryRepository -> telemetryDB "Inserciones de alta frecuencia" "TCP/Driver"
                mapIntegrationAdapter -> googleMapsAPI "Consulta APIs externas" "HTTPS"
            }
            
            maintenanceService = container "MaintenanceService" "Gestión de alertas preventivas basadas en kilometraje GPS y tiempo" "Spring boot" {
                tags "Service"

                maintenanceController = component "MaintenanceController" "Endpoints para gestionar planes preventivos e historial de servicios" "REST Controller"
                maintenanceBusinessService = component "MaintenanceBusinessService" "Calcula el próximo servicio basado en el odómetro virtual y fechas de expiración" "Service Layer"
                gpsDistanceListener = component "GpsDistanceListener" "Escucha el kilometraje calculado por el TelemetryService para actualizar el uso del activo" "Event Handler"
                maintenanceRepository = component "MaintenanceRepository" "Persistencia de planes y registros técnicos" "Data Access"

                # Relaciones internas
                maintenanceController -> maintenanceBusinessService "Consulta estados de mantenimiento"
                gpsDistanceListener -> maintenanceBusinessService "Notifica distancia recorrida acumulada"
                maintenanceBusinessService -> maintenanceRepository "Actualiza alertas preventivas"
                
                maintenanceRepository -> maintenanceDB "JDBC"
            }
            
            notificationService = container "NotificationService" "Orquestador de alertas y comunicaciones vía email" "Spring Boot" {
                tags "Service"

                notificationListener = component "NotificationListener" "Escucha eventos críticos (alertas de geocerca, mantenimiento) desde el Message Broker" "Event Handler"
                
                templateManager = component "TemplateManager" "Gestiona las plantillas HTML de los correos personalizadas por cada Tenant" "Business Component"
                
                notificationDispatcher = component "NotificationDispatcher" "Orquesta la lógica de despacho de mensajes" "Service Layer"
                
                emailAdapter = component "EmailAdapter" "Adaptador que encapsula la API del proveedor externo de correo" "Infrastructure Adapter"

                # Relaciones internas
                notificationListener -> notificationDispatcher "Solicita envío de alerta"
                notificationDispatcher -> templateManager "Solicita renderizado de plantilla"
                notificationDispatcher -> emailAdapter "Envía comando de despacho"
                
                emailAdapter -> emailService "Envía petición de correo" "HTTPS / REST API"
            }
            
        }
        
        
        #RELATIONSHIPS
        
        # Actores con Aplicaciones
        fleetManager -> loadBalancer "Utiliza el portal web" "Browser/HTTPS"
        loadBalancer -> fleetManagerSPA "Sirve la aplicación"
        driver -> mobileApp "Utiliza la app móvil"
        
        mobileApp -> apiGateway "Sincroniza datos de entrega" "HTTPS/JSON"
        fleetManagerSPA -> apiGateway "Realiza peticiones" "HTTPS/JSON"
        
        # Mobile App publica eventos en Message Broker (asíncrono)
        mobileApp -> messageBroker "Publica eventos de telemetría GPS" "MQTT/Asíncrono"
        
        # Enrutamiento hacia componentes de servicios críticos
        apiGateway -> tenantController "Valida credenciales e inyecta TenantId" "HTTPS/JSON"
        apiGateway -> authController ""
        apiGateway -> fleetController "Gestiona vehículos y conductores" "HTTPS/JSON"
        apiGateway -> dispatchController "Gestiona Hojas de Ruta" "HTTPS/REST"
        apiGateway -> telemetryController "Enruta peticiones HTTP hacia el controlador de mapas" "HTTPS/REST"
        apiGateway -> maintenanceController "Consulta alertas preventivas" "" 
        messageBroker -> telemetryMessageListener "Consume ráfagas de GPS" "AMQP"
        
        telemetryBusinessService -> messageBroker "Publica alertas de geocerca" "AMQP"
        messageBroker -> gpsDistanceListener "Notifica distancia recorrida" "AMQP"
        messageBroker -> notificationListener "Escucha alertas críticas" "AMQP"
        
    }
    
    views {
        
        systemContext orion {
            include *
            autolayout lr
            title "Orion - Diagrama de Contexto del Sistema (C4 Nivel 1)"
            description "Vista de alto nivel de Orion y sus interacciones con actores y sistemas externos"
        }
        
        container orion {
            include *
            autolayout tb
            title "Orion - Diagrama de Contenedores (C4 Nivel 2)"
            description "Descomposición de Orion en contenedores: aplicaciones, servicios, brokers y bases de datos"
        }
        
        #Components
        
        component telemetryService "ComponentDiagram" {
            include *
            autolayout tb
            title "Orion - Diagrama de Componentes (C4 Nivel 3): Telemetry & Maps Service"
            description "Componentes internos del microservicio de telemetría implementando ACL y Circuit Breaker."
        }

        component fleetService "FleetComponentDiagram" {
            include *
            autolayout tb
            title "Orion - Nivel 3: Fleet & Dispatch Service"
            description "Componentes internos del servicio de despacho logístico."
        }

        component iamService "IamComponentDiagram" {
            include *
            autolayout tb
            title "Orion - Nivel 3: IAM Service"
            description "Componentes internos encargados del aislamiento SaaS."
        }
        component notificationService "NotificationComponentDiagram" {
            include *
            autolayout tb
            title "Orion - Nivel 3: Notification Service"
            description "Componentes internos encargados del aislamiento SaaS."
        }
        component maintenanceService "MaintenanceComponentDiagram" {
            include *
            autolayout tb
            title "Orion - Nivel 3: Maintenance Service"
            description "Componentes internos encargados del aislamiento SaaS."
        }
        component dispatchService "DispatchComponentDiagram" {
            include *
            autolayout tb
            title "Orion - Nivel 3: Dispatch Service"
            description "Componentes internos encargados del aislamiento SaaS."
        }
        
        theme default
        styles {
            
            element "Person" {
                shape Person
            }
            
            element "External" {
                background #999999
            }
            
            element "Performance" {
                background #228B22
                shape Box
            }
            
            element "Web" {
                shape WebBrowser
                background #438dd5
            }
            
            element "Mobile" {
                shape MobileDeviceLandscape
            }
            
            element "Gateway" {
                background #438dd5
            }
            
            element "Service" {
                background #438dd5
            }
            
            element "Database" {
                background #438dd5
                shape Cylinder
            }
            
        }
    }
}
