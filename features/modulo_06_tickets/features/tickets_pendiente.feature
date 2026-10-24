# language: es
# Módulo 6 — Tickets — pendiente
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_06 @pendiente @requiere_integracion
Característica: Tickets - comportamiento pendiente
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-018 @pendiente @CA-rango-96-131
  Escenario: Exigir reglas de transición de estados
    Dado que están preparados los datos requeridos para "Exigir reglas de transición de estados"
    Cuando envío una solicitud PATCH a "/api/tickets/{ticketId}/status" con JSON:
      """
      {"status":"ABIERTO"}
      """
    Entonces verifico "transición validada según política"

  @HU-015 @pendiente @CA-rango-96-131
  Escenario: Restringir acceso sin JWT
    Dado que están preparados los datos requeridos para "Restringir acceso sin JWT"
    Cuando envío una solicitud GET a "/api/tickets"
    Entonces verifico "HTTP 401"

