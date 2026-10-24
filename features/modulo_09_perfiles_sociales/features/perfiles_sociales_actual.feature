# language: es
# Módulo 9 — Perfiles Sociales — actual
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_09 @actual @requiere_integracion
Característica: Perfiles Sociales - comportamiento actual
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-029 @actual @CA-rango-202-231
  Escenario: Crear perfil LinkedIn
    Dado que están preparados los datos requeridos para "Crear perfil LinkedIn"
    Cuando envío una solicitud POST a "/api/social-profiles" con JSON:
      """
      {"contact_id":1,"platform":"LINKEDIN","profile_url":"https://linkedin.com/in/qa"}
      """
    Entonces verifico "success=true"

  @HU-029 @actual @CA-rango-202-231
  Escenario: Rechazar plataforma desconocida
    Dado que están preparados los datos requeridos para "Rechazar plataforma desconocida"
    Cuando envío una solicitud POST a "/api/social-profiles" con JSON:
      """
      {"contact_id":1,"platform":"TIKTOK","profile_url":"https://example.com"}
      """
    Entonces verifico "HTTP 400"

  @HU-029 @actual @CA-rango-202-231
  Escenario: Aceptar cadena sin formato URL
    Dado que están preparados los datos requeridos para "Aceptar cadena sin formato URL"
    Cuando envío una solicitud POST a "/api/social-profiles" con JSON:
      """
      {"contact_id":1,"platform":"OTRO","profile_url":"perfil-de-prueba"}
      """
    Entonces verifico "validación DTO permite cadena"

  @HU-030 @actual @CA-rango-202-231
  Escenario: Consultar perfiles activos
    Dado que están preparados los datos requeridos para "Consultar perfiles activos"
    Cuando envío una solicitud GET a "/api/social-profiles/contact/{contactId}"
    Entonces verifico "success=true y orden descendente"

  @HU-030 @actual @CA-rango-202-231
  Escenario: Consultar contacto sin perfiles
    Dado que están preparados los datos requeridos para "Consultar contacto sin perfiles"
    Cuando envío una solicitud GET a "/api/social-profiles/contact/999999"
    Entonces verifico "data=[]"

  @HU-030 @actual @CA-rango-202-231
  Escenario: Rechazar identificador inválido
    Dado que están preparados los datos requeridos para "Rechazar identificador inválido"
    Cuando envío una solicitud GET a "/api/social-profiles/contact/abc"
    Entonces verifico "success=false"

  @HU-031 @actual @CA-rango-202-231
  Escenario: Inactivar perfil
    Dado que están preparados los datos requeridos para "Inactivar perfil"
    Cuando envío una solicitud PATCH a "/api/social-profiles/{profileId}/inactivate"
    Entonces verifico "success=true"

  @HU-031 @actual @CA-rango-202-231
  Escenario: Repetir inactivación
    Dado que están preparados los datos requeridos para "Repetir inactivación"
    Cuando envío una solicitud PATCH a "/api/social-profiles/{profileId}/inactivate"
    Entonces verifico "success=false"

