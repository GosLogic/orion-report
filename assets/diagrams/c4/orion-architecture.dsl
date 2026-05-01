workspace "Orion - Fleet Management Platform" "C4 Architecture Model" {
    
    model {
        # ==========================================
        # PERSONAS / ACTORES
        # ==========================================
        fleetManager = person "Gestor Flota" "Usuario administrativo que gestiona rutas y monitorea la flota en tiempo real"
        driver = person "Conductor" "Usuario en campo que conduce el vehículo y reporta su ubicación mediante GPS"
        
        # ==========================================
        # SISTEMAS EXTERNOS
        # ==========================================
        googleMapsAPI = softwareSystem "Google Maps API" "Sistema cartográfico de terceros para geocodificación inversa y consultas de mapas" {
            tags "External"
        }
        
        identityProvider = softwareSystem "Identity Provider" "Sistema externo para emisión y validación de tokens JWT (Auth0/Cognito)" {
            tags "External"
        }
        
        # ==========================================
        # SISTEMA PRINCIPAL: ORION
        # ==========================================
        orion = softwareSystem "Orion" "Plataforma SaaS Cloud-Native y Multi-Tenant para gestión logística, ruteo y telemetría de flotas vehiculares con alta disponibilidad y performance" {
            tags "Orion"
            
            # ========== CONTENEDORES DEL SISTEMA ==========
            
            # Frontend Web
            fleetManagerSPA = container "FleetManagerSPA" "Portal web para el Gestor de Flota con dashboards de monitoreo y gestión de rutas" "Single-Page Application (React/Angular/Vue)" {
                tags "Web"
            }
            
            # Frontend Mobile
            mobileApp = container "MobileApp" "Aplicación nativa Offline-First para el Conductor con sincronización automática" "Mobile App (iOS/Android)" {
                tags "Mobile"
            }
            
            # ========== COMPONENTES DE PERFORMANCE & DISPONIBILIDAD ==========
            
            loadBalancer = container "LoadBalancer" "Distribuye el tráfico entrante para garantizar alta disponibilidad mediante redundancia activa y health checks" "Load Balancer (NGINX/HAProxy)" {
                tags "Performance"
            }
            
            messageBroker = container "MessageBroker" "Encola masivamente eventos de telemetría GPS para introducir concurrencia y desacoplamiento" "Message Broker (Apache Kafka)" {
                tags "Performance"
            }
            
            # ========== COMPONENTES DE ENRUTAMIENTO & ORQUESTACIÓN ==========
            
            apiGateway = container "ApiGateway" "Punto de entrada único que enruta requests, inyecta TenantId, rate limiting y autenticación" "API Gateway (Kong/Spring Cloud Gateway)" {
                tags "Gateway"
            }
            
            # ========== MICROSERVICIOS DE NEGOCIO ==========
            
            tenantService = container "TenantService" "Gestiona el aislamiento lógico de los clientes SaaS con políticas de Row-Level Security" "Microservice (Spring Boot/Node.js)" {
                tags "Service"
                tenantController = component "TenantController" "REST Controller que expone endpoints para el onboarding de nuevas empresas (Tenants)" "REST Controller"
                tenantBusinessService = component "TenantBusinessService" "Contiene la lógica de creación de espacios de trabajo aislados" "Service Layer"
                securityPolicyEnforcer = component "SecurityPolicyEnforcer" "Valida que las peticiones cumplan con el aislamiento lógico basado en TenantId" "Security Component"
                tenantRepository = component "TenantRepository" "Persiste la configuración de la empresa en la base de datos" "Data Access"
            }
            
            fleetDispatchService = container "FleetDispatchService" "Orquesta asignaciones inteligentes de vehículos, optimización de rutas y logística de última milla" "Microservice (Spring Boot/Node.js)" {
                tags "Service"
                dispatchController = component "DispatchController" "REST Controller que expone endpoints para asignar rutas y vehículos" "REST Controller"
                fleetAssignmentService = component "FleetAssignmentService" "Lógica de negocio central que orquesta la asignación logística y disponibilidad" "Service Layer"
                maintenanceChecker = component "MaintenanceChecker" "Verifica si el vehículo está en condiciones óptimas para operar o si tiene alertas preventivas pendientes" "Business Component"
                fleetRepository = component "FleetRepository" "Patrón repositorio encargado de persistir las asignaciones en la base de datos relacional CoreDB" "Data Access"
            }
            
            telemetryMapsService = container "TelemetryMapsService" "Procesa ubicaciones GPS en tiempo real, integración con Google Maps y Circuit Breaker para resiliencia" "Microservice (Spring Boot/Node.js)" {
                tags "Service"

                telemetryMessageListener = component "TelemetryMessageListener" "Controller / Event Handler que escucha eventos asíncronos que llegan del Message Broker" "Controller / Event Handler"
                mapQueryController = component "MapQueryController" "REST Controller que expone endpoints sincrónicos para que el API Gateway consulte datos de ubicación" "REST Controller"
                telemetryBusinessService = component "TelemetryBusinessService" "Servicio de negocio que valida coordenadas, calcula distancias y evalúa geocercas" "Service Layer"
                telemetryRepository = component "TelemetryRepository" "Repositorio de acceso a datos que aísla la persistencia hacia la base de datos Time-Series" "Data Access"
                mapIntegrationAdapter = component "MapIntegrationAdapter" "Adaptador ACL que encapsula la comunicación con la API de Google Maps implementando Circuit Breaker" "Anti-Corruption Layer"
            }
            
            # ========== BASES DE DATOS ==========
            
            coreDB = container "CoreDB" "Almacena datos transaccionales (usuarios, flotas, rutas) con Row-Level Security y transacciones ACID" "Relational Database (PostgreSQL 14+)" {
                tags "Database"
            }
            
            telemetryDB = container "TelemetryDB" "Almacena el log histórico masivo de posiciones GPS con compresión y retención automática" "Time-Series Database (TimescaleDB/InfluxDB)" {
                tags "Database"
            }
        }
        
        # ==========================================
        # RELACIONES ENTRE COMPONENTES
        # ==========================================
        
        # Actores con Aplicaciones
        fleetManager -> fleetManagerSPA "Utiliza el portal web" "Browser/HTTPS"
        driver -> mobileApp "Utiliza la app móvil" "Native App"
        
        # Aplicaciones con Load Balancer
        fleetManagerSPA -> loadBalancer "Realiza peticiones HTTP/REST" "HTTPS"
        mobileApp -> loadBalancer "Realiza peticiones sincrónicas HTTP/REST" "HTTPS"
        
        # Load Balancer con API Gateway (enrutamiento)
        loadBalancer -> apiGateway "Enruta el tráfico HTTP hacia la puerta de entrada" "HTTPS/REST"
        
        # Mobile App publica eventos en Message Broker (asíncrono)
        mobileApp -> messageBroker "Publica eventos de telemetría GPS" "MQTT/Asíncrono"
        
        # API Gateway valida tokens con Identity Provider
        apiGateway -> identityProvider "Valida tokens JWT emitidos por el proveedor" "HTTPS/REST"
        
        # Enrutamiento hacia componentes de servicios críticos
        apiGateway -> tenantController "Enruta peticiones HTTP hacia el controlador de tenants" "HTTPS/REST"
        apiGateway -> dispatchController "Enruta peticiones HTTP hacia el controlador de despacho" "HTTPS/REST"
        apiGateway -> mapQueryController "Enruta peticiones HTTP hacia el controlador de mapas" "HTTPS/REST"
        messageBroker -> telemetryMessageListener "Envía coordenadas asíncronas hacia el listener de telemetría" "AMQP"
        
        # Componentes internos de TenantService
        tenantController -> tenantBusinessService "Envía datos de onboarding para procesamiento" "Llamada a método"
        tenantBusinessService -> securityPolicyEnforcer "Valida políticas de aislamiento lógico" "Llamada a método"
        tenantBusinessService -> tenantRepository "Persiste configuración de tenant" "Llamada a método"
        tenantRepository -> coreDB "Lee y escribe configuración de tenant" "JDBC"
        
        # Componentes internos de FleetDispatchService
        dispatchController -> fleetAssignmentService "Solicita asignaciones logísticas" "Llamada a método"
        fleetAssignmentService -> maintenanceChecker "Consulta estado de mantenimiento del vehículo" "Llamada a método"
        fleetAssignmentService -> fleetRepository "Persiste asignaciones logísticas" "Llamada a método"
        fleetRepository -> coreDB "Lee y escribe asignaciones de flota" "JDBC"
        
        # Enrutamiento específico hacia componentes de TelemetryMapsService
        telemetryMessageListener -> telemetryBusinessService "Envía datos validados para procesamiento" "Llamada a método"
        mapQueryController -> telemetryBusinessService "Solicita procesamiento y datos de negocio" "Llamada a método"
        telemetryBusinessService -> telemetryRepository "Persiste datos de telemetría" "Llamada a método"
        telemetryBusinessService -> mapIntegrationAdapter "Solicita datos cartográficos con Circuit Breaker" "Llamada a método"
        telemetryRepository -> telemetryDB "Lee y escribe datos históricos de posiciones GPS" "TCP/Driver"
        mapIntegrationAdapter -> googleMapsAPI "Consulta geocodificación y mapas" "HTTPS"
    }
    
    views {
        
        # ==========================================
        # VISTA: DIAGRAMA DE CONTEXTO (C4 NIVEL 1)
        # ==========================================
        systemContext orion {
            include *
            autolayout lr
            title "Orion - Diagrama de Contexto del Sistema (C4 Nivel 1)"
            description "Vista de alto nivel de Orion y sus interacciones con actores y sistemas externos"
        }
        
        # ==========================================
        # VISTA: DIAGRAMA DE CONTENEDORES (C4 NIVEL 2)
        # ==========================================
        container orion {
            include *
            autolayout tb
            title "Orion - Diagrama de Contenedores (C4 Nivel 2)"
            description "Descomposición de Orion en contenedores: aplicaciones, servicios, brokers y bases de datos"
        }

        component telemetryMapsService "ComponentDiagram" {
            include *
            autolayout tb
            title "Orion - Diagrama de Componentes (C4 Nivel 3): Telemetry & Maps Service"
            description "Componentes internos del microservicio de telemetría implementando ACL y Circuit Breaker."
        }

        component fleetDispatchService "FleetDispatchComponentDiagram" {
            include *
            autolayout tb
            title "Orion - Nivel 3: Fleet & Dispatch Service"
            description "Componentes internos del servicio de despacho logístico."
        }

        component tenantService "TenantComponentDiagram" {
            include *
            autolayout tb
            title "Orion - Nivel 3: Tenant Management Service"
            description "Componentes internos encargados del aislamiento SaaS."
        }
        
        # ==========================================
        # ESTILOS Y COLORES
        # ==========================================
        styles {
            
            # Estilos para Actores/Personas
            element "Person" {
                shape Person
                background #08427b
                color #ffffff
                fontSize 13
                icon https://structurizr.com/static/img/shapes/person.png
            }
            
            # Estilos para el Sistema Principal Orion (AZUL)
            element "Orion" {
                background #438dd5
                color #ffffff
                fontSize 14
                shape Box
            }
            
            # Estilos para Sistemas Externos (GRIS)
            element "External" {
                background #999999
                color #ffffff
                fontSize 11
                shape Box
            }
            
            # Estilos para LoadBalancer y MessageBroker (VERDE - Componentes tácticos de Performance)
            element "Performance" {
                background #228B22
                color #ffffff
                fontSize 12
                shape Box
                border Solid
                opacity 100
            }
            
            # Estilos para Aplicaciones Web
            element "Web" {
                background #438dd5
                color #ffffff
                fontSize 11
                shape Box
            }
            
            # Estilos para Aplicaciones Móviles
            element "Mobile" {
                background #438dd5
                color #ffffff
                fontSize 11
                shape Box
            }
            
            # Estilos para API Gateway
            element "Gateway" {
                background #438dd5
                color #ffffff
                fontSize 11
                shape Box
            }
            
            # Estilos para Microservicios
            element "Service" {
                background #438dd5
                color #ffffff
                fontSize 11
                shape Box
            }
            
            # Estilos para Componentes
            element "Component" {
                shape Component
                background #85bbf0
                color #000000
                fontSize 11
            }
            
            # Estilos para Bases de Datos (CILINDRO)
            element "Database" {
                background #438dd5
                color #ffffff
                fontSize 11
                shape Cylinder
            }
            
            # Estilos para Relaciones
            relationship "Usa" {
                fontSize 9
                color #666666
                routing Direct
            }
            
            relationship "Consulta" {
                fontSize 9
                color #666666
                routing Direct
            }
        }
    }
}
