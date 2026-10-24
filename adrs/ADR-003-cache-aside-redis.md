# ADR-003: Estrategia propuesta de caché Redis Cache-Aside

- **Estado:** Propuesto; no asumir implementación activa.
- **Fecha:** 2026-10-23
- **Contexto:** Las consultas repetidas de contactos y catálogos podrían beneficiarse de caché temporal.
- **Decisión propuesta:** consultar Redis primero; ante cache miss, leer SQL Server y almacenar el resultado con TTL.
- **TTL iniciales propuestos:** contacto individual 15 min; listado de contactos 5 min; listado de usuarios 10 min; catálogos 60 min; búsquedas filtradas 5 min.
- **Invalidación:** al crear, editar, activar o inactivar un contacto, invalidar su clave y listados/búsquedas relacionados. Aplicar regla equivalente a usuarios y catálogos.
- **Consecuencias positivas:** menor latencia y carga de lectura si existe una tasa de aciertos suficiente.
- **Riesgos:** datos obsoletos, fallos de invalidación y complejidad de operación.
- **Criterio de aceptación:** pruebas de hit/miss, invalidación tras mutación, expiración y medición de hit ratio/latencia antes de producción.
