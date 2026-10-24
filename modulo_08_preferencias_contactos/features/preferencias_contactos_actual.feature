# language: es
# Módulo 8 — Preferencias Contactos — actual
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_08 @actual @requiere_integracion
Característica: Preferencias Contactos - comportamiento actual
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-026 @actual @CA-rango-176-201
  Escenario: Registrar preferencias nuevas
    Dado que están preparados los datos requeridos para "Registrar preferencias nuevas"
    Cuando envío una solicitud POST a "/api/contact-preferences" con JSON:
      """
      {"contact_id":1,"preferred_channel":"WHATSAPP","preferred_time":"Por la mañana","notes":"Enviar mensaje"}
      """
    Entonces verifico "success=true"

  @HU-026 @actual @CA-rango-176-201
  Escenario: Registrar solo canal preferido
    Dado que están preparados los datos requeridos para "Registrar solo canal preferido"
    Cuando envío una solicitud POST a "/api/contact-preferences" con JSON:
      """
      {"contact_id":1,"preferred_channel":"EMAIL"}
      """
    Entonces verifico "success=true y opcionales null"

  @HU-026 @actual @CA-rango-176-201
  Escenario: Rechazar canal SMS
    Dado que están preparados los datos requeridos para "Rechazar canal SMS"
    Cuando envío una solicitud POST a "/api/contact-preferences" con JSON:
      """
      {"contact_id":1,"preferred_channel":"SMS"}
      """
    Entonces verifico "HTTP 400"

  @HU-027 @actual @CA-rango-176-201
  Escenario: Actualizar preferencias existentes
    Dado que están preparados los datos requeridos para "Actualizar preferencias existentes"
    Cuando envío una solicitud POST a "/api/contact-preferences" con JSON:
      """
      {"contact_id":1,"preferred_channel":"LLAMADA"}
      """
    Entonces verifico "success=true y opcionales null"

  @HU-027 @actual @CA-rango-176-201
  Escenario: Reactivar preferencias inactivas
    Dado que están preparados los datos requeridos para "Reactivar preferencias inactivas"
    Cuando envío una solicitud POST a "/api/contact-preferences" con JSON:
      """
      {"contact_id":1,"preferred_channel":"REUNION"}
      """
    Entonces verifico "is_active=1"

  @HU-028 @actual @CA-rango-176-201
  Escenario: Consultar preferencias activas
    Dado que están preparados los datos requeridos para "Consultar preferencias activas"
    Cuando envío una solicitud GET a "/api/contact-preferences/contact/{contactId}"
    Entonces verifico "success=true"

  @HU-028 @actual @CA-rango-176-201
  Escenario: Consultar contacto sin preferencias
    Dado que están preparados los datos requeridos para "Consultar contacto sin preferencias"
    Cuando envío una solicitud GET a "/api/contact-preferences/contact/999999"
    Entonces verifico "success=true y data=null"

  @HU-028 @actual @CA-rango-176-201
  Escenario: Rechazar identificador inválido
    Dado que están preparados los datos requeridos para "Rechazar identificador inválido"
    Cuando envío una solicitud GET a "/api/contact-preferences/contact/abc"
    Entonces verifico "success=false"

