# Fase 2 - CRM / Modulo 1: Autenticacion
# Basado en auth.controller.ts, aut.service.ts, login.dto.ts, auth.module.ts y main.ts.
# Estos escenarios describen el comportamiento actual, no pruebas ya ejecutadas.
# Requiere fixtures de usuarios activos e inactivos y contrasenas conocidas.
# HTTP 201 en POST es el comportamiento predeterminado de NestJS sin @HttpCode.

# language: es
@modulo_01 @HU-001 @implementado @requiere_integracion
Característica: Autenticación de usuarios según el backend actual
  Como usuario del CRM
  Quiero iniciar sesión con mis credenciales
  Para obtener un token JWT y mis datos de identificación

  Antecedentes:
    Dado que el servicio de autenticación y SQL Server están disponibles

  @CA-001 @CA-002 @CA-003 @positivo
  Escenario: Inicio de sesión exitoso con un usuario activo
    Dado que existe un usuario activo llamado "usuario_activo" con contraseña "ClaveSegura123"
    Cuando envío una solicitud POST a "/api/auth/login" con:
      """
      {"username":"usuario_activo","password":"ClaveSegura123"}
      """
    Entonces el código HTTP debe ser 201
    Y el campo "success" de la respuesta debe ser verdadero
    Y el campo "message" debe ser "Login realizado correctamente"
    Y el campo "data.access_token" debe contener un texto no vacío
    Y el campo "data.user.username" debe ser "usuario_activo"
    Y el campo "data.user" no debe contener "password"

  @CA-001 @alternativo
  Escenario: El nombre de usuario se normaliza quitando espacios exteriores
    Dado que existe un usuario activo llamado "usuario_activo" con contraseña "ClaveSegura123"
    Cuando envío una solicitud POST a "/api/auth/login" con:
      """
      {"username":"  usuario_activo  ","password":"ClaveSegura123"}
      """
    Entonces el campo "success" de la respuesta debe ser verdadero

  @CA-004 @negativo
  Esquema del escenario: Se rechazan credenciales que no corresponden a un usuario activo
    Dado que existe la condición de cuenta "<condicion>" para "<usuario>"
    Cuando envío una solicitud POST a "/api/auth/login" con usuario "<usuario>" y contraseña "<password>"
    Entonces el código HTTP debe ser 201
    Y el campo "success" de la respuesta debe ser falso
    Y el campo "message" debe ser "Usuario o password incorrecto"
    Y el campo "data" debe ser nulo

    Ejemplos:
      | condicion             | usuario          | password         |
      | usuario inexistente   | usuario_ausente  | ClaveSegura123   |
      | contraseña incorrecta | usuario_activo   | ClaveIncorrecta  |
      | usuario inactivo      | usuario_inactivo | ClaveSegura123   |

  @CA-001 @CA-002 @validacion
  Esquema del escenario: Se rechazan campos obligatorios ausentes
    Cuando envío una solicitud POST a "/api/auth/login" con:
      """
      <json>
      """
    Entonces el código HTTP debe ser 400
    Y el campo "success" de la respuesta debe ser falso
    Y el campo "data" debe ser nulo

    Ejemplos:
      | json                                    |
      | {"password":"ClaveSegura123"}          |
      | {"username":"usuario_activo"}         |
      | {"username":"","password":"Clave"}  |
      | {"username":"usuario_activo","password":""} |

  @CA-003 @validacion
  Esquema del escenario: Se rechazan campos con tipo incorrecto
    Cuando envío una solicitud POST a "/api/auth/login" con:
      """
      <json>
      """
    Entonces el código HTTP debe ser 400
    Y el campo "success" de la respuesta debe ser falso

    Ejemplos:
      | json                                           |
      | {"username":123,"password":"ClaveSegura123"} |
      | {"username":"usuario_activo","password":123} |

  @CA-003 @limite
  Escenario: Se rechaza un nombre de usuario de más de 50 caracteres
    Cuando envío una solicitud POST a "/api/auth/login" con un username de 51 caracteres y una contraseña válida
    Entonces el código HTTP debe ser 400
    Y el campo "message" debe contener "El usuario no debe superar 50 caracteres"

  @CA-003 @limite
  Escenario: Se rechaza una contraseña de más de 100 caracteres
    Cuando envío una solicitud POST a "/api/auth/login" con un username válido y una contraseña de 101 caracteres
    Entonces el código HTTP debe ser 400
    Y el campo "message" debe contener "La password no debe superar 100 caracteres"

  @CA-003 @validacion
  Escenario: Se rechazan propiedades desconocidas en el cuerpo
    Cuando envío una solicitud POST a "/api/auth/login" con:
      """
      {"username":"usuario_activo","password":"ClaveSegura123","admin":true}
      """
    Entonces el código HTTP debe ser 400
    Y el campo "success" de la respuesta debe ser falso

  @CA-005 @integracion
  Escenario: El token JWT contiene los claims definidos por el servicio
    Dado que existe un usuario activo llamado "usuario_activo" con contraseña "ClaveSegura123"
    Cuando inicio sesión correctamente como "usuario_activo"
    Entonces el token JWT debe contener los claims "sub", "username", "user_code" y "role"
    Y el token JWT debe tener un tiempo de expiración configurado
