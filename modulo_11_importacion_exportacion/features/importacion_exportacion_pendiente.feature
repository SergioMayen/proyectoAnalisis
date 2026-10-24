# language: es
# Módulo 11 — Importacion Exportacion — pendiente
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_11 @pendiente @requiere_integracion
Característica: Importacion Exportacion - comportamiento pendiente
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-035 @pendiente @CA-rango-255-279
  Escenario: Responder HTTP 400 ante arreglo vacío
    Dado que están preparados los datos requeridos para "Responder HTTP 400 ante arreglo vacío"
    Cuando envío una solicitud POST a "/api/import-export/contacts" con JSON:
      """
      []
      """
    Entonces verifico "HTTP 400"

  @HU-034 @pendiente @CA-rango-255-279
  Escenario: Restringir exportación sin JWT
    Dado que están preparados los datos requeridos para "Restringir exportación sin JWT"
    Cuando envío una solicitud GET a "/api/import-export/contacts"
    Entonces verifico "HTTP 401"

  @HU-035 @pendiente @CA-rango-255-279
  Escenario: Validar longitudes y tipos por fila
    Dado que están preparados los datos requeridos para "Validar longitudes y tipos por fila"
    Cuando envío una solicitud POST a "/api/import-export/contacts" con JSON:
      """
      [{"nombres":"Ana","apellidos":"López","email":"ana.qa@example.test","telefono":1234}]
      """
    Entonces verifico "error de validación por fila"

