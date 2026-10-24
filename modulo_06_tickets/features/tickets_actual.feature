# language: es
# Módulo 6 — Tickets — actual
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_06 @actual @requiere_integracion
Característica: Tickets - comportamiento actual
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-015 @actual @CA-rango-96-131
  Escenario: Crear ticket con estado predeterminado
    Dado que están preparados los datos requeridos para "Crear ticket con estado predeterminado"
    Cuando envío una solicitud POST a "/api/tickets" con JSON:
      """
      {"contact_id":1,"title":"Falla en equipo","created_by":1}
      """
    Entonces verifico "success=true y status=ABIERTO"

  @HU-015 @actual @CA-rango-96-131
  Escenario: Rechazar título vacío
    Dado que están preparados los datos requeridos para "Rechazar título vacío"
    Cuando envío una solicitud POST a "/api/tickets" con JSON:
      """
      {"contact_id":1,"title":"","created_by":1}
      """
    Entonces verifico "HTTP 400"

  @HU-015 @actual @CA-rango-96-131
  Escenario: Rechazar estado desconocido
    Dado que están preparados los datos requeridos para "Rechazar estado desconocido"
    Cuando envío una solicitud POST a "/api/tickets" con JSON:
      """
      {"contact_id":1,"title":"Falla","created_by":1,"status":"PAUSADO"}
      """
    Entonces verifico "HTTP 400"

  @HU-016 @actual @CA-rango-96-131
  Escenario: Listar tickets activos
    Dado que están preparados los datos requeridos para "Listar tickets activos"
    Cuando envío una solicitud GET a "/api/tickets"
    Entonces verifico "success=true y solo activos"

  @HU-017 @actual @CA-rango-96-131
  Escenario: Consultar tickets de un contacto
    Dado que están preparados los datos requeridos para "Consultar tickets de un contacto"
    Cuando envío una solicitud GET a "/api/tickets/contact/{contactId}"
    Entonces verifico "success=true"

  @HU-017 @actual @CA-rango-96-131
  Escenario: Rechazar ID inválido
    Dado que están preparados los datos requeridos para "Rechazar ID inválido"
    Cuando envío una solicitud GET a "/api/tickets/contact/abc"
    Entonces verifico "success=false"

  @HU-018 @actual @CA-rango-96-131
  Escenario: Actualizar estado a EN_PROCESO
    Dado que están preparados los datos requeridos para "Actualizar estado a EN_PROCESO"
    Cuando envío una solicitud PATCH a "/api/tickets/{ticketId}/status" con JSON:
      """
      {"status":"EN_PROCESO"}
      """
    Entonces verifico "success=true"

  @HU-018 @actual @CA-rango-96-131
  Escenario: Rechazar estado no permitido
    Dado que están preparados los datos requeridos para "Rechazar estado no permitido"
    Cuando envío una solicitud PATCH a "/api/tickets/{ticketId}/status" con JSON:
      """
      {"status":"PAUSADO"}
      """
    Entonces verifico "HTTP 400"

  @HU-019 @actual @CA-rango-96-131
  Escenario: Inactivar ticket activo
    Dado que están preparados los datos requeridos para "Inactivar ticket activo"
    Cuando envío una solicitud PATCH a "/api/tickets/{ticketId}/inactivate"
    Entonces verifico "success=true"

  @HU-019 @actual @CA-rango-96-131
  Escenario: Repetir inactivación
    Dado que están preparados los datos requeridos para "Repetir inactivación"
    Cuando envío una solicitud PATCH a "/api/tickets/{ticketId}/inactivate"
    Entonces verifico "success=false"

