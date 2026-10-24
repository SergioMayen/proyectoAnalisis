# language: es
# Requisitos propuestos; NO se espera que pasen sobre el backend actual.
@modulo_02 @pendiente
Característica: Seguridad y robustez pendientes en la gestión de usuarios
  Como administrador del CRM
  Quiero proteger las cuentas y recibir errores HTTP consistentes
  Para administrar usuarios de manera segura

  @HU-002 @HU-003 @HU-004 @HU-005 @CA-029 @seguridad
  Esquema del escenario: Denegar operaciones sin token JWT
    Dado que no envío un token JWT
    Cuando solicito "<metodo>" a "<ruta>"
    Entonces el código HTTP debe ser 401
    Ejemplos:
      | metodo | ruta                       |
      | POST   | /api/users                 |
      | GET    | /api/users                 |
      | PATCH  | /api/users/101/inactivate  |
      | PATCH  | /api/users/103/activate    |

  @HU-002 @HU-004 @HU-005 @CA-030 @seguridad
  Escenario: Denegar a un rol sin permisos la administración de usuarios
    Dado que estoy autenticado con un rol sin permiso de administración
    Cuando envío POST a "/api/users" con datos válidos
    Entonces el código HTTP debe ser 403

  @HU-004 @HU-005 @http
  Esquema del escenario: Responder HTTP 400 ante identificadores inválidos
    Dado que estoy autenticado como administrador
    Cuando envío PATCH a "<ruta>"
    Entonces el código HTTP debe ser 400
    Y el campo "success" debe ser falso
    Ejemplos:
      | ruta                          |
      | /api/users/abc/inactivate     |
      | /api/users/0/activate         |

  @HU-004 @HU-005 @http
  Escenario: Responder HTTP 404 cuando el usuario no existe
    Dado que estoy autenticado como administrador
    Y no existe un usuario con id 999999
    Cuando envío PATCH a "/api/users/999999/inactivate"
    Entonces el código HTTP debe ser 404

  @HU-002 @concurrencia
  Escenario: Evitar colisiones en el código correlativo bajo altas simultáneas
    Dado que estoy autenticado como administrador
    Cuando creo simultáneamente dos usuarios con rol "OPR"
    Entonces ambos usuarios deben tener códigos únicos
    Y ambas solicitudes deben tener un resultado consistente

  @HU-002 @normalizacion
  Escenario: Rechazar nombres formados solamente por espacios
    Dado que estoy autenticado como administrador
    Cuando envío POST a "/api/users" con el campo "first_name" igual a "   "
    Entonces el código HTTP debe ser 400
