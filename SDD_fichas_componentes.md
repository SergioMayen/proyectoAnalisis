# Fichas de diseño de software (SDD) — CRM


## SDD-01: Autenticación (`src/auth`)
- **Responsabilidad:** recibir credenciales y gestionar el proceso de autenticación.
- **Interfaz:** endpoint de login descrito en OpenAPI; DTO de inicio de sesión.
- **Dependencias:** AuthService, consulta de usuario, servicio JWT y configuración.
- **Datos:** identidad, estado y rol del usuario; nunca registrar contraseña ni token.
- **Excepciones:** datos inválidos (400), credenciales inválidas (401), fallo interno (500).
- **Pruebas:** credenciales válidas/inválidas, usuario inactivo, DTO incompleto.

## SDD-02: Contactos (`src/contacts`)
- **Responsabilidad:** crear, consultar y actualizar contactos.
- **Interfaz:** controlador de contactos y DTO de creación/actualización.
- **Dependencias:** ContactsService, DatabaseService/SQL Server.
- **Excepciones:** validación (400), registro inexistente (404 si así lo implementa el contrato), conflicto de datos (409 si corresponde), error interno (500).
- **Pruebas:** alta válida, campos requeridos, consulta, actualización e inactivación.

## SDD-03: Usuarios (`src/users`)
- **Responsabilidad:** gestionar usuarios del CRM.
- **Interfaz:** controlador y DTO de usuario.
- **Dependencias:** UsersService, DatabaseService.
- **Seguridad:** aplicar controles de rol y proteger credenciales.
- **Pruebas:** alta, listado, estado, rol no permitido y duplicados.

## SDD-04: Interacciones (`src/interactions`)
- **Responsabilidad:** registrar y consultar interacciones de contactos.
- **Dependencias:** InteractionsService y SQL Server.
- **Excepciones:** contacto no existente, DTO inválido, fallo de persistencia.
- **Pruebas:** interacción válida, vínculo de contacto, campos faltantes.

## SDD-05: Tickets (`src/tickets`)
- **Responsabilidad:** crear tickets, consultarlos y gestionar estados.
- **Dependencias:** TicketsService, contactos y persistencia.
- **Excepciones:** estado inválido, ID inexistente, datos incompletos.
- **Pruebas:** creación, consulta, actualización de estado y transición inválida.

## SDD-06: Catálogos (`src/catalogs`)
- **Responsabilidad:** gestionar etiquetas/categorías y asignarlas a contactos.
- **Dependencias:** CatalogsService y SQL Server.
- **Excepciones:** duplicados, referencia inexistente, validación.
- **Pruebas:** crear catálogo y asignar/desasignar según endpoints reales.

## SDD-07: Búsqueda avanzada (`src/search`)
- **Responsabilidad:** combinar criterios de búsqueda admitidos.
- **Dependencias:** SearchService y persistencia.
- **Excepciones:** filtro no válido y errores de consulta.
- **Pruebas:** cada filtro, combinaciones y resultados vacíos.

## SDD-08: Importación/exportación (`src/import-export`)
- **Responsabilidad:** importar y exportar contactos en formatos admitidos.
- **Dependencias:** ImportExportService y persistencia.
- **Excepciones:** archivo/formato inválido, filas rechazadas y fallo de persistencia.
- **Pruebas:** archivo válido, inválido, duplicados y errores parciales.

## SDD-09: Alertas (`src/alerts`)
- **Responsabilidad:** consultar alertas definidas por reglas de negocio.
- **Dependencias:** AlertsService y consultas de datos.
- **Excepciones:** parámetros inválidos y fallos de consulta.
- **Pruebas:** casos con alertas, sin alertas y límites de fechas.

## SDD-10: Preferencias y perfiles sociales
- **Responsabilidad:** registrar preferencias de contacto y perfiles sociales.
- **Dependencias:** módulos respectivos, DTO y persistencia.
- **Excepciones:** contacto inexistente, datos inválidos, URL/formato no permitido.
- **Pruebas:** alta, actualización/upsert y consulta.

## Reglas transversales
- Validar solicitudes en DTO antes de ejecutar lógica de negocio.
- Mantener controllers delgados; concentrar reglas en servicios.
- Usar parámetros SQL y evitar concatenación de entradas.
- Unificar errores sin filtrar stack traces ni datos sensibles.
- No declarar Redis, gateways, circuit breakers ni bases adicionales como implementados hasta comprobarlo.
