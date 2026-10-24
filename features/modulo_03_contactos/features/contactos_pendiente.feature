# language: es
# Módulo 3 — Contactos — pendiente
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_03 @pendiente @requiere_integracion
Característica: Contactos - comportamiento pendiente
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-006 @pendiente @CA-rango-31-59
  Escenario: Rechazar acceso sin JWT
    Dado que están preparados los datos requeridos para "Rechazar acceso sin JWT"
    Cuando envío una solicitud POST a "/api/contacts" con JSON:
      """
      {"nombres":"Ana","apellidos":"López","email":"ana.qa@example.test","pipeline_status":"SEGUIMIENTO"}
      """
    Entonces verifico "HTTP 401"

