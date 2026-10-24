# language: es
# Módulo 2 — caracterización del código actual (no ejecutado)
# Fuentes: users.controller.ts, users.service.ts, dto/create-user.dto.ts, main.ts
# Requiere base de datos de pruebas aislada, fixtures y step definitions.
@modulo_02 @implementado @requiere_integracion
Característica: Gestión de usuarios según el comportamiento actual del CRM
  Como operador del CRM
  Quiero registrar, consultar, activar e inactivar usuarios
  Para administrar las cuentas de la plataforma

  Antecedentes:
    Dado que el backend y la base de datos de pruebas están disponibles

  @HU-002 @CA-008 @CA-009 @CA-010 @positivo
  Escenario: Registrar un usuario con los campos obligatorios
    Dado que no existe un usuario con username "qa_nuevo" ni email "qa_nuevo@example.test"
    Cuando envío POST a "/api/users" con JSON:
      """
      {"username":"qa_nuevo","first_name":"Ana","first_lastname":"Pérez","email":"qa_nuevo@example.test","password":"Clave123","role":"OPR"}
      """
    Entonces el código HTTP debe ser 201
    Y el campo "success" debe ser verdadero
    Y el campo "message" debe ser "Usuario creado correctamente"
    Y "data.username" debe ser "qa_nuevo"
    Y "data.role" debe ser "OPR"
    Y "data.user_code" debe iniciar con "OPR"
    Y la respuesta no debe exponer el campo "password"
    Y la contraseña almacenada debe ser un hash bcrypt diferente de "Clave123"

  @HU-002 @CA-011 @alternativo
  Escenario: Normalizar los datos al crear un usuario
    Dado que no existe un usuario con username "qa_normalizado" ni email "normalizado@example.test"
    Cuando envío POST a "/api/users" con JSON:
      """
      {"username":"  qa_normalizado  ","first_name":"  María  ","first_lastname":"  López  ","email":"  NORMALIZADO@EXAMPLE.TEST  ","password":"Clave123","role":"ADM"}
      """
    Entonces el campo "success" debe ser verdadero
    Y "data.username" debe ser "qa_normalizado"
    Y "data.email" debe ser "normalizado@example.test"

  @HU-002 @CA-012 @positivo
  Esquema del escenario: Aceptar cada rol definido en el DTO
    Dado que no existe el usuario de prueba "<username>"
    Cuando registro el usuario "<username>" con email "<email>" y rol "<rol>"
    Entonces el campo "success" debe ser verdadero
    Y "data.role" debe ser "<rol>"
    Y "data.user_code" debe iniciar con "<rol>"
    Ejemplos:
      | username | email                   | rol |
      | qa_sup   | qa_sup@example.test     | SUP |
      | qa_adm   | qa_adm@example.test     | ADM |
      | qa_opr   | qa_opr@example.test     | OPR |
      | qa_cli   | qa_cli@example.test     | CLI |
      | qa_spt   | qa_spt@example.test     | SPT |

  @HU-002 @CA-013 @CA-014 @negativo
  Esquema del escenario: Rechazar campos obligatorios ausentes o inválidos
    Cuando envío POST a "/api/users" con JSON:
      """
      <json>
      """
    Entonces el código HTTP debe ser 400
    Y el campo "success" debe ser falso
    Y el campo "data" debe ser nulo
    Ejemplos:
      | json                                                                                                                                        |
      | {"first_name":"Ana","first_lastname":"Pérez","email":"a@example.test","password":"Clave123","role":"OPR"}                              |
      | {"username":"qa_a","first_lastname":"Pérez","email":"a@example.test","password":"Clave123","role":"OPR"}                             |
      | {"username":"qa_a","first_name":"Ana","email":"a@example.test","password":"Clave123","role":"OPR"}                                   |
      | {"username":"qa_a","first_name":"Ana","first_lastname":"Pérez","email":"invalido","password":"Clave123","role":"OPR"}                |
      | {"username":"qa_a","first_name":"Ana","first_lastname":"Pérez","email":"a@example.test","password":"12345","role":"OPR"}            |
      | {"username":"qa_a","first_name":"Ana","first_lastname":"Pérez","email":"a@example.test","password":"Clave123","role":"ROOT"}       |

  @HU-002 @CA-015 @negativo
  Escenario: Rechazar propiedades desconocidas por la validación global
    Cuando envío POST a "/api/users" con JSON:
      """
      {"username":"qa_extra","first_name":"Ana","first_lastname":"Pérez","email":"extra@example.test","password":"Clave123","role":"OPR","is_active":false}
      """
    Entonces el código HTTP debe ser 400
    Y el campo "success" debe ser falso

  @HU-002 @CA-016 @negativo @requiere_restriccion_bd
  Escenario: Manejar duplicados cuando SQL Server tiene una restricción única
    Dado que existe un usuario con username "qa_existente" y email "existente@example.test"
    Y que la base de datos aplica una restricción única al username
    Cuando registro otro usuario con username "qa_existente" y email "otro@example.test"
    Entonces el código HTTP debe ser 201
    Y el campo "success" debe ser falso
    Y el campo "message" debe ser "Ya existe un usuario con el mismo username, user_code o email"

  @HU-003 @CA-017 @CA-018 @positivo
  Escenario: Consultar todos los usuarios incluyendo los inactivos
    Dado que existen usuarios activos e inactivos en la base de pruebas
    Cuando envío GET a "/api/users"
    Entonces el código HTTP debe ser 200
    Y el campo "success" debe ser verdadero
    Y el campo "message" debe ser "Usuarios consultados correctamente"
    Y "data" debe ser un arreglo
    Y el arreglo debe contener usuarios activos e inactivos
    Y los registros deben estar ordenados por "created_at" descendente
    Y ningún usuario de la respuesta debe contener "password"

  @HU-003 @CA-019 @alternativo
  Escenario: Consultar usuarios cuando la tabla está vacía
    Dado que no existen usuarios en la base de pruebas
    Cuando envío GET a "/api/users"
    Entonces el código HTTP debe ser 200
    Y el campo "data" debe ser un arreglo vacío

  @HU-004 @CA-020 @CA-021 @positivo
  Escenario: Inactivar un usuario activo
    Dado que existe un usuario activo con id 101
    Cuando envío PATCH a "/api/users/101/inactivate"
    Entonces el código HTTP debe ser 200
    Y el campo "success" debe ser verdadero
    Y el campo "message" debe ser "Usuario inactivado correctamente"
    Y el campo "data" debe ser nulo
    Y el usuario 101 debe tener "is_active" igual a falso

  @HU-004 @CA-022 @negativo
  Escenario: Rechazar una segunda inactivación
    Dado que existe un usuario inactivo con id 102
    Cuando envío PATCH a "/api/users/102/inactivate"
    Entonces el código HTTP debe ser 200
    Y el campo "success" debe ser falso
    Y el campo "message" debe ser "Usuario no encontrado o ya se encuentra inactivo"

  @HU-004 @CA-023 @negativo
  Esquema del escenario: Rechazar identificadores inválidos al inactivar
    Cuando envío PATCH a "/api/users/<id>/inactivate"
    Entonces el código HTTP debe ser 200
    Y el campo "success" debe ser falso
    Y el campo "message" debe ser "Id de usuario inválido"
    Ejemplos:
      | id  |
      | abc |
      | 0   |
      | -1  |
      | 1.5 |

  @HU-005 @CA-024 @CA-025 @positivo
  Escenario: Activar un usuario inactivo
    Dado que existe un usuario inactivo con id 103
    Cuando envío PATCH a "/api/users/103/activate"
    Entonces el código HTTP debe ser 200
    Y el campo "success" debe ser verdadero
    Y el campo "message" debe ser "Usuario activado correctamente"
    Y el usuario 103 debe tener "is_active" igual a verdadero

  @HU-005 @CA-026 @negativo
  Escenario: Rechazar una segunda activación
    Dado que existe un usuario activo con id 104
    Cuando envío PATCH a "/api/users/104/activate"
    Entonces el código HTTP debe ser 200
    Y el campo "success" debe ser falso
    Y el campo "message" debe ser "Usuario no encontrado o ya se encuentra activo"

  @HU-005 @CA-027 @negativo
  Esquema del escenario: Rechazar identificadores inválidos al activar
    Cuando envío PATCH a "/api/users/<id>/activate"
    Entonces el código HTTP debe ser 200
    Y el campo "success" debe ser falso
    Y el campo "message" debe ser "Id de usuario inválido"
    Ejemplos:
      | id  |
      | abc |
      | 0   |
      | -1  |

  @HU-004 @HU-005 @CA-028 @alternativo
  Escenario: Un usuario inexistente no puede activarse ni inactivarse
    Dado que no existe un usuario con id 999999
    Cuando envío PATCH a "/api/users/999999/inactivate"
    Entonces el campo "success" debe ser falso
    Cuando envío PATCH a "/api/users/999999/activate"
    Entonces el campo "success" debe ser falso
