# language: es
# Módulo 5 — Interacciones — pendiente
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_05 @pendiente @requiere_integracion
Característica: Interacciones - comportamiento pendiente
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-013 @pendiente @CA-rango-79-95
  Escenario: Restringir registro sin JWT
    Dado que están preparados los datos requeridos para "Restringir registro sin JWT"
    Cuando envío una solicitud POST a "/api/interactions" con JSON:
      """
      {"contact_id":1,"interaction_type":"LLAMADA","descripcion":"QA","created_by":1}
      """
    Entonces verifico "HTTP 401"

