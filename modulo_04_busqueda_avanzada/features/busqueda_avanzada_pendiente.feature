# language: es
# Módulo 4 — Busqueda Avanzada — pendiente
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_04 @pendiente @requiere_integracion
Característica: Busqueda Avanzada - comportamiento pendiente
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-012 @pendiente @CA-rango-60-78
  Escenario: Validar identificadores no numéricos de filtros
    Dado que están preparados los datos requeridos para "Validar identificadores no numéricos de filtros"
    Cuando envío una solicitud GET a "/api/search/contacts?tag_id=abc"
    Entonces verifico "HTTP 400"

  @HU-010 @pendiente @CA-rango-60-78
  Escenario: Exigir autenticación
    Dado que están preparados los datos requeridos para "Exigir autenticación"
    Cuando envío una solicitud GET a "/api/search/contacts"
    Entonces verifico "HTTP 401"

