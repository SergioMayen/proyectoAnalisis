# language: es
# Módulo 10 — Alertas — actual
# Contrato verificado estáticamente contra controllers, services, DTO y main.ts.
# Sin step definitions ni ejecución contra SQL Server.
# Los CA se vinculan por intervalo del módulo: el mapeo CA individual requiere cotejo con la matriz original.
@modulo_10 @actual @requiere_integracion
Característica: Alertas - comportamiento actual
  Como responsable del CRM
  Quiero verificar las operaciones de este módulo
  Para documentar el contrato observado y sus mejoras

  Antecedentes:
    Dado que existe un entorno de pruebas aislado con datos controlados

  @HU-032 @actual @CA-rango-232-254
  Escenario: Consultar próximos eventos por defecto
    Dado que están preparados los datos requeridos para "Consultar próximos eventos por defecto"
    Cuando envío una solicitud GET a "/api/alerts/upcoming"
    Entonces verifico "success=true y ventana 30 días"

  @HU-032 @actual @CA-rango-232-254
  Escenario: Consultar cumpleaños y aniversarios
    Dado que están preparados los datos requeridos para "Consultar cumpleaños y aniversarios"
    Cuando envío una solicitud GET a "/api/alerts/upcoming?days=15"
    Entonces verifico "eventos de contactos y usuarios activos"

  @HU-032 @actual @CA-rango-232-254
  Escenario: Ordenar por próxima fecha
    Dado que están preparados los datos requeridos para "Ordenar por próxima fecha"
    Cuando envío una solicitud GET a "/api/alerts/upcoming?days=60"
    Entonces verifico "orden next_alert_date ASC"

  @HU-033 @actual @CA-rango-232-254
  Escenario: Consultar ventana de siete días
    Dado que están preparados los datos requeridos para "Consultar ventana de siete días"
    Cuando envío una solicitud GET a "/api/alerts/upcoming?days=7"
    Entonces verifico "rango de hoy a hoy+7 inclusive"

  @HU-033 @actual @CA-rango-232-254
  Escenario: Usar valor por defecto cuando days es cero
    Dado que están preparados los datos requeridos para "Usar valor por defecto cuando days es cero"
    Cuando envío una solicitud GET a "/api/alerts/upcoming?days=0"
    Entonces verifico "ventana 30 días"

  @HU-033 @actual @CA-rango-232-254
  Escenario: Usar valor por defecto para days no numérico
    Dado que están preparados los datos requeridos para "Usar valor por defecto para days no numérico"
    Cuando envío una solicitud GET a "/api/alerts/upcoming?days=abc"
    Entonces verifico "ventana 30 días"

