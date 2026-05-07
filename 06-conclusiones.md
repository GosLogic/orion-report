# Conclusiones y recomendaciones

## Conclusiones

En conclusión, logramos resolver el problema central del proyecto: la ineficiencia y la falta de control operativo en la gestión de flotas para PYMES. Durante la fase inicial de Lean UX planteamos la hipótesis de que centralizar la logística en la nube optimizaría el monitoreo de los activos. Esto se materializó con éxito al diseñar una arquitectura SaaS Cloud-Native. Además, logramos mitigar el riesgo más crítico del negocio, que era la posible exposición de datos entre empresas competidoras, implementando tácticas de Row-Level Security en nuestra base de datos relacional y validando estrictamente el TenantId desde el API Gateway.

Por otro lado, logramos manejar el supuesto sobre la pérdida de conectividad de los conductores en rutas rurales directamente desde el diseño de la arquitectura. Al establecer un enfoque offline-first con persistencia local en SQLite y tácticas de resincronización automática para la app móvil, garantizamos la continuidad de la operación. Esta decisión cumple con los criterios de éxito de usabilidad proyectados, ya que permite a los conductores registrar su jornada sin depender de una red de internet estable.

Finalmente, aplicar el método ADD v3 nos permitió resolver el desafío de procesar la telemetría GPS masiva sin saturar el sistema. Para lograrlo, adoptamos una arquitectura orientada a eventos usando Apache ActiveMQ y un almacenamiento especializado en series de tiempo con TimescaleDB. Todo este diseño se ejecutó respetando nuestra restricción principal de usar solo tecnologías Open Source, asegurando que la plataforma Orion sea un producto rentable.

## Recomendaciones y Roadmap

Para asegurar que el producto siga creciendo de forma escalable, recomendamos integrar las siguientes iniciativas estratégicas al Roadmap de Orion:

Evolución a Mantenimiento Predictivo con IA: Cuando la base de datos TelemetryDB acumule suficiente información histórica sobre el comportamiento de las flotas, el sistema debería dar el siguiente paso. Recomendamos integrar modelos de Machine Learning para identificar patrones anómalos y predecir fallas mecánicas antes de que ocurran, pasando de un modelo de alertas simples a uno predictivo basado en el riesgo real del vehículo.

Escalabilidad Física del Aislamiento Multi-Tenant: A medida que la plataforma sume clientes corporativos más grandes con auditorías estrictas, será necesario evolucionar el modelo de datos. Recomendamos planificar una transición del esquema actual compartido hacia un enfoque físico de Schema-per-Tenant o Database-per-Tenant. Esto mejorará el rendimiento de cada cliente, reforzará la seguridad y evitará que la alta carga de una empresa afecte a las demás en la base de datos central.

## Video About-the-Team

*Contenido por desarrollar.*
