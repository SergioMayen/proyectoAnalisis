# language: es
# Módulo 9 — Perfiles Sociales — pendiente
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_09 @pendiente @requiere_integracion
Característica: Perfiles Sociales - comportamiento pendiente
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-029 @pendiente @CA-rango-202-231
  Escenario: Rechazar dirección sin formato URL
    Dado que están preparados los datos requeridos para "Rechazar dirección sin formato URL"
    Cuando envío una solicitud POST a "/api/social-profiles" con JSON:
      """
      {"contact_id":1,"platform":"OTRO","profile_url":"perfil-de-prueba"}
      """
    Entonces verifico "HTTP 400"

  @HU-029 @pendiente @CA-rango-202-231
  Escenario: Validar contacto existente y activo
    Dado que están preparados los datos requeridos para "Validar contacto existente y activo"
    Cuando envío una solicitud POST a "/api/social-profiles" con JSON:
      """
      {"contact_id":999999,"platform":"LINKEDIN","profile_url":"https://linkedin.com/in/qa"}
      """
    Entonces verifico "error controlado de negocio"

