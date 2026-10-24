# ADR-004: Evaluación de persistencia políglota

- **Estado:** Rechazado para adopción inmediata; reevaluar si aparece un caso de uso medible.
- **Fecha:** 2026-10-23
- **Contexto:** El requerimiento académico menciona PostgreSQL, MongoDB, Redis y Neo4j, pero el código recibido evidencia SQL Server y no confirma conexión funcional a esos cuatro motores.
- **Decisión:** no incorporar múltiples motores solo para cumplir una lista tecnológica. Mantener SQL Server y justificar cada tecnología mediante una necesidad concreta.
- **Criterios de reevaluación:** requisitos de consulta, volumen, latencia, estructura de datos, costo operativo, respaldo, seguridad y capacidad del equipo.
- **Consecuencias:** se reduce complejidad y riesgo de consistencia distribuida; se posterga cualquier beneficio específico de una base documental o de grafos.
