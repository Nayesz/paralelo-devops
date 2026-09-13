ARG TAG_VERSION_BUILD=3.9-eclipse-temurin-25-alpine
ARG TAG_VERSION=25-jre-alpine

# STAGE 1 - BUILD

FROM maven:${TAG_VERSION_BUILD} AS build

WORKDIR /app

# Primero copiamos el pom con las dependencias, para que docker utilice esta capa
# "cacheada", ya que lo que es dependencias no cambia muy seguido
COPY pom.xml .

# Descarga de dependencias
RUN mvn dependency:go-offline

# Despues se copia el codigo que es lo que mas cambia
COPY src ./src

# Compila y genera el jar
RUN mvn clean package -DskipTests

# =========================
# STAGE 2 - PRD
# =========================

ARG TAG_VERSION=25-jre-alpine

FROM eclipse-temurin:${TAG_VERSION} AS prd

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]