# language: es
# Requisitos propuestos NO implementados en el backend inspeccionado.
# No incluir en la suite de regresion verde hasta implementar las mejoras.
@modulo_01 @HU-001 @pendiente
Característica: Seguridad y contrato HTTP esperado para autenticación
  Como responsable de seguridad del CRM
  Quiero proteger los accesos y devolver códigos HTTP semánticos
  Para impedir accesos no autorizados y facilitar el manejo de errores

  @CA-007 @seguridad @pendiente
  Esquema del escenario: Las credenciales incorrectas devuelven HTTP 401
    Dado que existe la condición de cuenta "<condicion>" para "<usuario>"
    Cuando envío una solicitud POST a "/api/auth/login" con usuario "<usuario>" y contraseña "<password>"
    Entonces el código HTTP debe ser 401
    Y el campo "success" de la respuesta debe ser falso
    Y el campo "data" debe ser nulo

    Ejemplos:
      | condicion             | usuario          | password         |
      | usuario inexistente   | usuario_ausente  | ClaveSegura123   |
      | contraseña incorrecta | usuario_activo   | ClaveIncorrecta  |
      | usuario inactivo      | usuario_inactivo | ClaveSegura123   |

  @CA-006 @seguridad @pendiente
  Escenario: Una ruta privada rechaza solicitudes sin JWT
    Dado que existe una ruta privada del CRM protegida con guard JWT
    Cuando envío una solicitud a esa ruta sin encabezado Authorization
    Entonces el código HTTP debe ser 401

  @CA-006 @seguridad @pendiente
  Escenario: Una ruta privada rechaza un JWT inválido
    Dado que existe una ruta privada del CRM protegida con guard JWT
    Cuando envío una solicitud a esa ruta con un token JWT inválido
    Entonces el código HTTP debe ser 401

  @CA-006 @seguridad @pendiente
  Escenario: Una ruta privada acepta un JWT válido con permisos suficientes
    Dado que existe una ruta privada del CRM protegida con guard JWT
    Y tengo un JWT válido para un usuario autorizado
    Cuando envío una solicitud a esa ruta con el encabezado Authorization Bearer
    Entonces la solicitud no debe rechazarse por falta de autenticación

  @seguridad @configuracion @pendiente
  Escenario: La aplicación no arranca en producción sin un secreto JWT configurado
    Dado que la aplicación está configurada para producción
    Y no se ha definido la variable JWT_SECRET
    Cuando se inicializa el módulo de autenticación
    Entonces la inicialización debe fallar con un error de configuración
