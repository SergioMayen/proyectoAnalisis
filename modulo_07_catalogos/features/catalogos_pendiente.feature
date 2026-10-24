# language: es
# Módulo 7 — Catalogos — pendiente
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_07 @pendiente @requiere_integracion
Característica: Catalogos - comportamiento pendiente
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-020 @pendiente @CA-rango-132-175
  Escenario: Rechazar nombre compuesto solo por espacios
    Dado que están preparados los datos requeridos para "Rechazar nombre compuesto solo por espacios"
    Cuando envío una solicitud POST a "/api/catalogs/tags" con JSON:
      """
      {"name":"   "}
      """
    Entonces verifico "HTTP 400"

  @HU-024 @pendiente @CA-rango-132-175
  Escenario: Restringir asignaciones sin JWT
    Dado que están preparados los datos requeridos para "Restringir asignaciones sin JWT"
    Cuando envío una solicitud POST a "/api/catalogs/contact-tags" con JSON:
      """
      {"contact_id":1,"tag_id":1}
      """
    Entonces verifico "HTTP 401"

