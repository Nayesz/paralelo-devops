# Guía de contribución para yo del futuro

## Estrategia de branching: GitFlow

- `main`: producción. Cada merge es un release taggeado (`vX.Y.Z`).
- `develop`: integración continua de features, base de la próxima release.
- `feature/*`: sale de `develop`, vuelve a `develop`.
- `release/*`: sale de `develop`, va a `main` y `develop`. Solo fixes menores y bump de versión.
- `hotfix/*`: sale de `main`, va a `main` y `develop`. Solo para bugs urgentes en producción.

## Convención de nombres

- `feature/nombre-corto`
- `release/X.Y.Z`
- `hotfix/X.Y.Z`

## Reglas

1. Nunca commitear directo a `main` o `develop`.
2. Toda `release/*` y `hotfix/*` que llega a `main` debe taggearse (`git tag vX.Y.Z`).
3. Toda `release/*` y `hotfix/*` mergeada a `main` **también** se mergea a `develop`.
4. Commits con Conventional Commits (`feat:`, `fix:`, `chore:`).
5. PR requiere mínimo 1 aprobación + CI verde.

## Templates para Conventional Commits

[Conventional Commits](https://www.conventionalcommits.org/es/v1.0.0/).

The commit message should be structured as follows:

<type>[optional scope]: <description>

[optional body]

[optional footer(s)]

---

Generalmente se usa:
`<tipo>(<alcance opcional>): <descripción corta>`

**Tipos principales:**
   - `feat`: nueva funcionalidad
   - `fix`: corrección de bug
   - `chore`: tareas de mantenimiento (deps, config, CI, sin cambio de lógica)
   - `docs`: solo documentación
   - `test`: agregar o corregir tests
   - `refactor`: cambio de código que no agrega feature ni corrige bug
   - `perf`: mejora de performance
   - `build`: cambios en el sistema de build (Maven, Docker)
   - `ci`: cambios en workflows de CI/CD

**Ejemplos:**

* feat(auth): agregar login con OAuth2
* fix(checkout): corregir null pointer al calcular total del carrito
* chore(deps): actualizar spring-boot a 3.3.0
* docs(readme): agregar instrucciones de instalación
* test(cart): agregar tests unitarios para CartService
* refactor(user): extraer validación a clase separada
* build(docker): usar imagen base eclipse-temurin en vez de openjdk
* ci(actions): agregar job de docker-publish en release


**Breaking changes:** agregar `!` después del tipo y explicar el cambio en el footer

* feat(api)!: cambiar formato de respuesta de /users

    BREAKING CHANGE: el campo "name" ahora se divide en "firstName" y "lastName"


