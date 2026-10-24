# language: es
# Módulo 11 — Importacion Exportacion — actual
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_11 @actual @requiere_integracion
Característica: Importacion Exportacion - comportamiento actual
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-034 @actual @CA-rango-255-279
  Escenario: Exportar contactos como JSON
    Dado que están preparados los datos requeridos para "Exportar contactos como JSON"
    Cuando envío una solicitud GET a "/api/import-export/contacts"
    Entonces verifico "success=true y arreglo JSON"

  @HU-034 @actual @CA-rango-255-279
  Escenario: Incluir activos e inactivos
    Dado que están preparados los datos requeridos para "Incluir activos e inactivos"
    Cuando envío una solicitud GET a "/api/import-export/contacts"
    Entonces verifico "contiene ambos estados"

  @HU-034 @actual @CA-rango-255-279
  Escenario: Ordenar exportación por fecha descendente
    Dado que están preparados los datos requeridos para "Ordenar exportación por fecha descendente"
    Cuando envío una solicitud GET a "/api/import-export/contacts"
    Entonces verifico "orden created_at DESC"

  @HU-035 @actual @CA-rango-255-279
  Escenario: Importar arreglo de contactos
    Dado que están preparados los datos requeridos para "Importar arreglo de contactos"
    Cuando envío una solicitud POST a "/api/import-export/contacts" con JSON:
      """
      [{"nombres":"Ana","apellidos":"López","email":"ana.qa@example.test"}]
      """
    Entonces verifico "success=true y contadores"

  @HU-035 @actual @CA-rango-255-279
  Escenario: Rechazar objeto en lugar de arreglo
    Dado que están preparados los datos requeridos para "Rechazar objeto en lugar de arreglo"
    Cuando envío una solicitud POST a "/api/import-export/contacts" con JSON:
      """
      {"contacts":[{"nombres":"Ana","apellidos":"López","email":"ana.qa@example.test"}]}
      """
    Entonces verifico "success=false"

  @HU-035 @actual @CA-rango-255-279
  Escenario: Rechazar arreglo vacío
    Dado que están preparados los datos requeridos para "Rechazar arreglo vacío"
    Cuando envío una solicitud POST a "/api/import-export/contacts" con JSON:
      """
      []
      """
    Entonces verifico "success=false"

  @HU-035 @actual @CA-rango-255-279
  Escenario: Omitir email duplicado
    Dado que están preparados los datos requeridos para "Omitir email duplicado"
    Cuando envío una solicitud POST a "/api/import-export/contacts" con JSON:
      """
      [{"nombres":"Ana","apellidos":"López","email":"ana.qa@example.test"}]
      """
    Entonces verifico "skipped incrementa y errors registra duplicado"

  @HU-035 @actual @CA-rango-255-279
  Escenario: Normalizar estado desconocido
    Dado que están preparados los datos requeridos para "Normalizar estado desconocido"
    Cuando envío una solicitud POST a "/api/import-export/contacts" con JSON:
      """
      [{"nombres":"Ana","apellidos":"López","email":"ana2.qa@example.test","pipeline_status":"DESCONOCIDO"}]
      """
    Entonces verifico "pipeline_status=CONVERSACION_INICIAL"

  @HU-035 @actual @CA-rango-255-279
  Escenario: Rechazar email inválido
    Dado que están preparados los datos requeridos para "Rechazar email inválido"
    Cuando envío una solicitud POST a "/api/import-export/contacts" con JSON:
      """
      [{"nombres":"Ana","apellidos":"López","email":"invalido"}]
      """
    Entonces verifico "success=false"

