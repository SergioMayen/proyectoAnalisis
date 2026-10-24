# language: es
# Módulo 10 — Alertas — pendiente
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_10 @pendiente @requiere_integracion
Característica: Alertas - comportamiento pendiente
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-033 @pendiente @CA-rango-232-254
  Escenario: Rechazar período negativo
    Dado que están preparados los datos requeridos para "Rechazar período negativo"
    Cuando envío una solicitud GET a "/api/alerts/upcoming?days=-5"
    Entonces verifico "HTTP 400"

  @HU-033 @pendiente @CA-rango-232-254
  Escenario: Rechazar período decimal
    Dado que están preparados los datos requeridos para "Rechazar período decimal"
    Cuando envío una solicitud GET a "/api/alerts/upcoming?days=1.5"
    Entonces verifico "HTTP 400"

  @HU-032 @pendiente @CA-rango-232-254
  Escenario: Exigir autenticación
    Dado que están preparados los datos requeridos para "Exigir autenticación"
    Cuando envío una solicitud GET a "/api/alerts/upcoming"
    Entonces verifico "HTTP 401"

