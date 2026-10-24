# language: es
# Módulo 4 — Busqueda Avanzada — actual
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_04 @actual @requiere_integracion
Característica: Busqueda Avanzada - comportamiento actual
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-010 @actual @CA-rango-60-78
  Escenario: Consultar contactos sin filtros
    Dado que están preparados los datos requeridos para "Consultar contactos sin filtros"
    Cuando envío una solicitud GET a "/api/search/contacts"
    Entonces verifico "success=true"

  @HU-010 @actual @CA-rango-60-78
  Escenario: Buscar por nombre o email
    Dado que están preparados los datos requeridos para "Buscar por nombre o email"
    Cuando envío una solicitud GET a "/api/search/contacts?text=Ana"
    Entonces verifico "success=true"

  @HU-011 @actual @CA-rango-60-78
  Escenario: Filtrar por empresa
    Dado que están preparados los datos requeridos para "Filtrar por empresa"
    Cuando envío una solicitud GET a "/api/search/contacts?empresa=Empresa"
    Entonces verifico "success=true"

  @HU-011 @actual @CA-rango-60-78
  Escenario: Filtrar por estado de pipeline
    Dado que están preparados los datos requeridos para "Filtrar por estado de pipeline"
    Cuando envío una solicitud GET a "/api/search/contacts?pipeline_status=SEGUIMIENTO"
    Entonces verifico "success=true"

  @HU-012 @actual @CA-rango-60-78
  Escenario: Combinar etiqueta y categoría
    Dado que están preparados los datos requeridos para "Combinar etiqueta y categoría"
    Cuando envío una solicitud GET a "/api/search/contacts?tag_id={tagId}&category_id={categoryId}"
    Entonces verifico "success=true y filtros combinados AND"

  @HU-012 @actual @CA-rango-60-78
  Escenario: Excluir contactos inactivos
    Dado que están preparados los datos requeridos para "Excluir contactos inactivos"
    Cuando envío una solicitud GET a "/api/search/contacts"
    Entonces verifico "no aparecen contactos inactivos"

