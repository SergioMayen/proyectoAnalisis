# language: es
# Módulo 12 — Ruta Raiz — pendiente
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_12 @pendiente @requiere_integracion
Característica: Ruta Raiz - comportamiento pendiente
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-036 @pendiente @CA-rango-280-289
  Escenario: Exponer ruta raíz tras registrar AppController
    Dado que están preparados los datos requeridos para "Exponer ruta raíz tras registrar AppController"
    Cuando envío una solicitud GET a "/api/"
    Entonces verifico "HTTP 200 y texto Hello World!"

  @HU-036 @pendiente @CA-rango-280-289
  Escenario: Comprobar que ruta no accede a SQL Server
    Dado que están preparados los datos requeridos para "Comprobar que ruta no accede a SQL Server"
    Cuando envío una solicitud GET a "/api/"
    Entonces verifico "sin consultas de base de datos"

