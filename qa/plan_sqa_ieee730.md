# Plan de Aseguramiento de Calidad de Software (SQA)
## Proyecto CRM — versión inicial de trabajo

### 1. Propósito
Definir actividades preventivas y de verificación para asegurar que los cambios del backend cumplan requisitos, contrato API, seguridad y criterios de aceptación.

### 2. Alcance
Backend NestJS/TypeScript, módulos API, integración con SQL Server, contrato OpenAPI, colección Postman, escenarios BDD y documentación asociada. No incluye certificación formal de conformidad.

### 3. QA y QC
- **QA:** prevención mediante procesos, revisión de requisitos, estándares, revisión de código y automatización.
- **QC:** detección mediante pruebas, inspecciones y verificación de resultados.

### 4. Enfoque Shift-Left
Validar criterios de aceptación antes de codificar; revisar DTO y contrato API en pull request; ejecutar lint/build/unit tests en cada cambio; probar integración antes de fusionar; ejecutar pruebas API/E2E antes de la entrega.

### 5. Niveles de prueba
- **Unitarias:** reglas de servicio, validadores y lógica aislada.
- **Integración:** servicios contra SQL Server de pruebas, integridad y transacciones.
- **API/E2E:** login, alta/consulta de contactos, usuarios, interacciones y tickets.
- **No funcionales:** seguridad básica, rendimiento con carga acordada, accesibilidad del frontend si forma parte del alcance.

### 6. Criterios de entrada
Requisito con criterios de aceptación, entorno reproducible, datos de prueba preparados y versión identificada.

### 7. Criterios de salida
Pruebas planeadas ejecutadas; resultados adjuntos; sin defectos críticos abiertos; defectos altos aceptados formalmente o corregidos; contrato y documentación actualizados.

### 8. Seguridad y datos
No incluir credenciales reales en repositorio ni evidencia. Redactar tokens y datos personales en logs. Usar base de pruebas y restablecer datos entre ejecuciones.

### 9. Gestión de defectos
Usar `docs/qa/reporte_defectos_ieee1044.md`. Registrar severidad, prioridad, evidencia, pasos de reproducción, causa y verificación.

### 10. Métricas sugeridas
- Porcentaje de pruebas ejecutadas y aprobadas.
- Defectos abiertos por severidad.
- Cobertura unitaria donde la herramienta la mida.
- Tasa de éxito de pruebas API.
- Latencia p50/p95 bajo carga definida.

No declarar métricas hasta ejecutarlas y adjuntar reportes.

### 11. Responsabilidades
Desarrollo mantiene pruebas y corrige defectos; QA define estrategia y verifica; Product Owner acepta criterios funcionales; equipo documenta cambios y riesgos.

### 12. Referencia
Estructura inspirada en prácticas de aseguramiento de calidad y en IEEE 730-2014. Confirmar la edición y requisitos aplicables en la publicación oficial; este documento no constituye certificación.
