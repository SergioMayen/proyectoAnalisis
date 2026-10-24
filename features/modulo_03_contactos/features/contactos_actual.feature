# language: es
# Módulo 3 — Contactos — actual
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_03 @actual @requiere_integracion
Característica: Contactos - comportamiento actual
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-006 @actual @CA-rango-31-59
  Escenario: Registrar contacto válido
    Dado que están preparados los datos requeridos para "Registrar contacto válido"
    Cuando envío una solicitud POST a "/api/contacts" con JSON:
      """
      {"nombres":"Ana","apellidos":"López","email":"ana.qa@example.test","pipeline_status":"SEGUIMIENTO"}
      """
    Entonces verifico "success=true"

  @HU-006 @actual @CA-rango-31-59
  Escenario: Rechazar correo inválido
    Dado que están preparados los datos requeridos para "Rechazar correo inválido"
    Cuando envío una solicitud POST a "/api/contacts" con JSON:
      """
      {"nombres":"Ana","apellidos":"López","email":"invalido","pipeline_status":"SEGUIMIENTO"}
      """
    Entonces verifico "HTTP 400"

  @HU-006 @actual @CA-rango-31-59
  Escenario: Rechazar estado de pipeline desconocido
    Dado que están preparados los datos requeridos para "Rechazar estado de pipeline desconocido"
    Cuando envío una solicitud POST a "/api/contacts" con JSON:
      """
      {"nombres":"Ana","apellidos":"López","email":"ana.qa@example.test","pipeline_status":"NUEVO"}
      """
    Entonces verifico "HTTP 400"

  @HU-007 @actual @CA-rango-31-59
  Escenario: Actualizar contacto activo con datos completos
    Dado que están preparados los datos requeridos para "Actualizar contacto activo con datos completos"
    Cuando envío una solicitud PUT a "/api/contacts/{contactId}" con JSON:
      """
      {"nombres":"Ana","apellidos":"López","email":"ana.qa@example.test","pipeline_status":"SEGUIMIENTO"}
      """
    Entonces verifico "success=true"

  @HU-007 @actual @CA-rango-31-59
  Escenario: Rechazar actualización parcial sin nombres
    Dado que están preparados los datos requeridos para "Rechazar actualización parcial sin nombres"
    Cuando envío una solicitud PUT a "/api/contacts/{contactId}" con JSON:
      """
      {"empresa":"Empresa QA"}
      """
    Entonces verifico "HTTP 400"

  @HU-007 @actual @CA-rango-31-59
  Escenario: Rechazar identificador no numérico
    Dado que están preparados los datos requeridos para "Rechazar identificador no numérico"
    Cuando envío una solicitud PUT a "/api/contacts/abc" con JSON:
      """
      {"nombres":"Ana","apellidos":"López","email":"ana.qa@example.test","pipeline_status":"SEGUIMIENTO"}
      """
    Entonces verifico "success=false"

  @HU-008 @actual @CA-rango-31-59
  Escenario: Listar solo contactos activos
    Dado que están preparados los datos requeridos para "Listar solo contactos activos"
    Cuando envío una solicitud GET a "/api/contacts"
    Entonces verifico "success=true y lista de activos"

  @HU-009 @actual @CA-rango-31-59
  Escenario: Buscar contactos por texto
    Dado que están preparados los datos requeridos para "Buscar contactos por texto"
    Cuando envío una solicitud GET a "/api/contacts?search=Ana"
    Entonces verifico "success=true y resultados coincidentes"

  @HU-009 @actual @CA-rango-31-59
  Escenario: Buscar sin coincidencias
    Dado que están preparados los datos requeridos para "Buscar sin coincidencias"
    Cuando envío una solicitud GET a "/api/contacts?search=zzzz-no-existe"
    Entonces verifico "data=[]"

