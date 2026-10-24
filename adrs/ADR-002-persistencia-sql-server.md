# ADR-002: SQL Server como persistencia relacional actual

- **Estado:** Aceptado como descripción del estado actual.
- **Fecha:** 2026-10-23
- **Contexto:** El backend incluye una capa DatabaseService y dependencia `mssql`; el repositorio contiene un script SQL para el CRM.
- **Decisión:** Mantener SQL Server como fuente de verdad para los datos relacionales de la versión actual.
- **Alternativas consideradas:** PostgreSQL, MongoDB, base documental complementaria y persistencia políglota.
- **Consecuencias positivas:** integridad referencial y transacciones relacionales.
- **Consecuencias negativas/riesgos:** dependencia de configuración, disponibilidad y rendimiento del motor.
- **Límite:** No afirmar que PostgreSQL, MongoDB o Neo4j están implementados sin adaptadores, configuración y pruebas verificables.
- **Validación:** ejecutar pruebas de integración contra una base de pruebas y documentar variables de entorno.
