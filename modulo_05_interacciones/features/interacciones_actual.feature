# language: es
# Módulo 5 — Interacciones — actual
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_05 @actual @requiere_integracion
Característica: Interacciones - comportamiento actual
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-013 @actual @CA-rango-79-95
  Escenario: Registrar llamada de contacto activo
    Dado que están preparados los datos requeridos para "Registrar llamada de contacto activo"
    Cuando envío una solicitud POST a "/api/interactions" con JSON:
      """
      {"contact_id":1,"interaction_type":"LLAMADA","descripcion":"Llamada de seguimiento","created_by":1}
      """
    Entonces verifico "success=true"

  @HU-013 @actual @CA-rango-79-95
  Escenario: Rechazar tipo desconocido
    Dado que están preparados los datos requeridos para "Rechazar tipo desconocido"
    Cuando envío una solicitud POST a "/api/interactions" con JSON:
      """
      {"contact_id":1,"interaction_type":"SMS","descripcion":"Seguimiento","created_by":1}
      """
    Entonces verifico "HTTP 400"

  @HU-013 @actual @CA-rango-79-95
  Escenario: Rechazar contacto inactivo
    Dado que están preparados los datos requeridos para "Rechazar contacto inactivo"
    Cuando envío una solicitud POST a "/api/interactions" con JSON:
      """
      {"contact_id":999999,"interaction_type":"EMAIL","descripcion":"Seguimiento","created_by":1}
      """
    Entonces verifico "success=false"

  @HU-013 @actual @CA-rango-79-95
  Escenario: Rechazar usuario creador inactivo
    Dado que están preparados los datos requeridos para "Rechazar usuario creador inactivo"
    Cuando envío una solicitud POST a "/api/interactions" con JSON:
      """
      {"contact_id":1,"interaction_type":"EMAIL","descripcion":"Seguimiento","created_by":999999}
      """
    Entonces verifico "success=false"

  @HU-014 @actual @CA-rango-79-95
  Escenario: Consultar historial por contacto
    Dado que están preparados los datos requeridos para "Consultar historial por contacto"
    Cuando envío una solicitud GET a "/api/interactions/contact/{contactId}"
    Entonces verifico "success=true y orden descendente"

  @HU-014 @actual @CA-rango-79-95
  Escenario: Rechazar identificador inválido
    Dado que están preparados los datos requeridos para "Rechazar identificador inválido"
    Cuando envío una solicitud GET a "/api/interactions/contact/abc"
    Entonces verifico "success=false"

