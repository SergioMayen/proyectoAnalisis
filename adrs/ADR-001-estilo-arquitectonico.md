# ADR-001: Arquitectura modular por capas

- **Estado:** Aceptado como descripción del estado actual.
- **Fecha:** 2026-10-23
- **Contexto:** El backend CRM utiliza NestJS y TypeScript. Los módulos organizan controladores, servicios, DTO y acceso a datos.
- **Decisión:** Mantener la arquitectura modular y separar transporte HTTP, reglas de negocio y persistencia.
- **Alternativas consideradas:** Monolito sin módulos; microservicios; arquitectura orientada a eventos.
- **Justificación:** La modularidad reduce el acoplamiento accidental y permite probar servicios. La adopción de microservicios aumentaría complejidad de despliegue y observabilidad sin evidencia de necesidad actual.
- **Consecuencias positivas:** límites funcionales claros, mantenibilidad y pruebas más focalizadas.
- **Consecuencias negativas/riesgos:** los módulos pueden acoplarse mediante el servicio de base de datos; se deben mantener interfaces claras.
- **Validación:** revisar imports, dependencias entre módulos y cobertura de pruebas.
