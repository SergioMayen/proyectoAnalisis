# language: es
# Módulo 7 — Catalogos — actual
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_07 @actual @requiere_integracion
Característica: Catalogos - comportamiento actual
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-020 @actual @CA-rango-132-175
  Escenario: Crear etiqueta
    Dado que están preparados los datos requeridos para "Crear etiqueta"
    Cuando envío una solicitud POST a "/api/catalogs/tags" con JSON:
      """
      {"name":"Prospecto"}
      """
    Entonces verifico "success=true"

  @HU-020 @actual @CA-rango-132-175
  Escenario: Rechazar etiqueta vacía
    Dado que están preparados los datos requeridos para "Rechazar etiqueta vacía"
    Cuando envío una solicitud POST a "/api/catalogs/tags" con JSON:
      """
      {"name":""}
      """
    Entonces verifico "HTTP 400"

  @HU-021 @actual @CA-rango-132-175
  Escenario: Listar etiquetas activas ordenadas
    Dado que están preparados los datos requeridos para "Listar etiquetas activas ordenadas"
    Cuando envío una solicitud GET a "/api/catalogs/tags"
    Entonces verifico "success=true y orden name ASC"

  @HU-022 @actual @CA-rango-132-175
  Escenario: Crear categoría con descripción
    Dado que están preparados los datos requeridos para "Crear categoría con descripción"
    Cuando envío una solicitud POST a "/api/catalogs/categories" con JSON:
      """
      {"name":"Industrial","description":"Clientes industriales"}
      """
    Entonces verifico "success=true"

  @HU-022 @actual @CA-rango-132-175
  Escenario: Crear categoría sin descripción
    Dado que están preparados los datos requeridos para "Crear categoría sin descripción"
    Cuando envío una solicitud POST a "/api/catalogs/categories" con JSON:
      """
      {"name":"Comercial"}
      """
    Entonces verifico "success=true y description=null"

  @HU-023 @actual @CA-rango-132-175
  Escenario: Listar categorías activas
    Dado que están preparados los datos requeridos para "Listar categorías activas"
    Cuando envío una solicitud GET a "/api/catalogs/categories"
    Entonces verifico "success=true y solo activas"

  @HU-024 @actual @CA-rango-132-175
  Escenario: Asignar etiqueta a contacto
    Dado que están preparados los datos requeridos para "Asignar etiqueta a contacto"
    Cuando envío una solicitud POST a "/api/catalogs/contact-tags" con JSON:
      """
      {"contact_id":1,"tag_id":1}
      """
    Entonces verifico "success=true"

  @HU-024 @actual @CA-rango-132-175
  Escenario: Rechazar contacto inexistente
    Dado que están preparados los datos requeridos para "Rechazar contacto inexistente"
    Cuando envío una solicitud POST a "/api/catalogs/contact-tags" con JSON:
      """
      {"contact_id":999999,"tag_id":1}
      """
    Entonces verifico "success=false"

  @HU-025 @actual @CA-rango-132-175
  Escenario: Asignar categoría a contacto
    Dado que están preparados los datos requeridos para "Asignar categoría a contacto"
    Cuando envío una solicitud POST a "/api/catalogs/contact-categories" con JSON:
      """
      {"contact_id":1,"category_id":1}
      """
    Entonces verifico "success=true"

  @HU-025 @actual @CA-rango-132-175
  Escenario: Rechazar categoría inexistente
    Dado que están preparados los datos requeridos para "Rechazar categoría inexistente"
    Cuando envío una solicitud POST a "/api/catalogs/contact-categories" con JSON:
      """
      {"contact_id":1,"category_id":999999}
      """
    Entonces verifico "success=false"

