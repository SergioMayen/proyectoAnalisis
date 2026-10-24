# language: es
# Módulo 12 — Ruta Raiz — actual
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_12 @actual @requiere_integracion
Característica: Ruta Raiz - comportamiento actual
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-036 @actual @CA-rango-280-289
  Escenario: Comprobar método de AppService
    Dado que están preparados los datos requeridos para "Comprobar método de AppService"
    Cuando envío una solicitud GET a "/api/"
    Entonces verifico "getHello() retorna Hello World! en prueba unitaria"

  @HU-036 @actual @CA-rango-280-289
  Escenario: Caracterizar ruta no registrada en AppModule
    Dado que están preparados los datos requeridos para "Caracterizar ruta no registrada en AppModule"
    Cuando envío una solicitud GET a "/api/"
    Entonces verifico "HTTP 404 en configuración actual"

