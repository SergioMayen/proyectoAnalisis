# language: es
# Módulo 8 — Preferencias Contactos — pendiente
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_08 @pendiente @requiere_integracion
Característica: Preferencias Contactos - comportamiento pendiente
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-026 @pendiente @CA-rango-176-201
  Escenario: Validar existencia del contacto
    Dado que están preparados los datos requeridos para "Validar existencia del contacto"
    Cuando envío una solicitud POST a "/api/contact-preferences" con JSON:
      """
      {"contact_id":999999,"preferred_channel":"EMAIL"}
      """
    Entonces verifico "HTTP 404 o 400 según contrato"

  @HU-027 @pendiente @CA-rango-176-201
  Escenario: Evitar duplicados en concurrencia
    Dado que están preparados los datos requeridos para "Evitar duplicados en concurrencia"
    Cuando envío una solicitud POST a "/api/contact-preferences" con JSON:
      """
      {"contact_id":1,"preferred_channel":"EMAIL"}
      """
    Entonces verifico "una sola fila por contacto"

