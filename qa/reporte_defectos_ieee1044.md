# Registro y gestión de defectos — guía IEEE 1044

## Campos mínimos
- ID único, título, fecha, versión/commit, módulo y entorno.
- Pasos de reproducción y datos de prueba no sensibles.
- Resultado esperado y resultado observado.
- Evidencia (captura, log redactado o reporte de prueba).
- Tipo, severidad, prioridad, responsable, estado, causa y resolución.

## Severidad y prioridad
| Severidad | Definición | Prioridad orientativa |
|---|---|---|
| Crítica | Caída general, exposición grave de datos o corrupción | P0 |
| Alta | Flujo principal bloqueado sin alternativa | P1 |
| Media | Función degradada con alternativa | P2 |
| Baja | Impacto menor visual o de conveniencia | P3 |

## Ciclo de vida
Nuevo → Clasificado → Asignado → En corrección → Listo para verificar → Cerrado.
Si falla la verificación: vuelve a En corrección.

## Plantilla
- ID:
- Título:
- Módulo/versión:
- Pasos:
- Esperado:
- Observado:
- Severidad/Prioridad:
- Evidencia:
- Causa raíz:
- Corrección:
- Verificación:
