# Backlog ágil — CRM

> El enlace al tablero debe completarse cuando exista un tablero real de Jira o GitHub Projects: **[PEGAR URL DEL TABLERO]**.

## Roles
- **Product Owner / Analista:** prioriza valor, aclara reglas, mantiene backlog y acepta historias.
- **Equipo de desarrollo:** diseña, implementa, prueba y documenta.
- **Responsable de QA:** define estrategia de pruebas, evidencia y seguimiento de defectos.

## Historias de usuario (3C)
### HU-01 — Autenticación
- **Card:** Como usuario registrado, quiero iniciar sesión para acceder al CRM según mis permisos.
- **Conversation:** confirmar campos, política de usuario inactivo, duración del token y mensajes.
- **Confirmation:** con credenciales válidas se entrega token; con inválidas se rechaza el acceso sin revelar información sensible.
- **INVEST:** independiente, negociable, valiosa, estimable, pequeña y comprobable.

### HU-02 — Gestión de contactos
- **Card:** Como operador, quiero registrar y actualizar contactos para mantener información vigente.
- **Conversation:** definir campos obligatorios, duplicidad, soft delete y permisos.
- **Confirmation:** contacto válido se persiste; entradas inválidas se rechazan; el registro aparece en la consulta.

### HU-03 — Búsqueda de contactos
- **Card:** Como operador, quiero filtrar contactos para encontrar registros rápidamente.
- **Conversation:** acordar filtros, coincidencias, orden y paginación.
- **Confirmation:** la respuesta contiene solo registros que satisfacen los filtros.

### HU-04 — Seguimiento de tickets
- **Card:** Como operador, quiero crear y actualizar tickets para dar seguimiento a solicitudes.
- **Conversation:** acordar estados, transiciones válidas, prioridades y relación con contacto.
- **Confirmation:** ticket válido se crea; una transición inválida devuelve un error controlado.

### HU-05 — Gestión de usuarios
- **Card:** Como administrador, quiero gestionar usuarios y roles para controlar el acceso.
- **Conversation:** confirmar roles permitidos y reglas de activación.
- **Confirmation:** los cambios se guardan y se respetan las reglas de autorización.

### HU-06 — Historial de interacciones
- **Card:** Como operador, quiero registrar interacciones asociadas a contactos para conservar trazabilidad.
- **Conversation:** definir tipos, fecha, descripción y responsable.
- **Confirmation:** interacción válida queda vinculada al contacto correcto.

## Definition of Ready (DoR)
- Historia con actor, objetivo y valor claros.
- Criterios de aceptación comprobables.
- Dependencias, datos y reglas de negocio identificados.
- Diseño/contrato afectado identificado.
- Historia estimable y de tamaño manejable.

## Definition of Done (DoD)
- Código revisado y compilación satisfactoria.
- Validación de entradas y manejo de errores.
- Pruebas apropiadas ejecutadas con evidencia.
- Contrato OpenAPI y colección Postman actualizados.
- Documentación y trazabilidad actualizadas.
- Sin secretos en código ni defectos críticos abiertos.
