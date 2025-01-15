FROM maven:3.8-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17
COPY --from=build /app/target/gerenciador.jar /usr/app/gerenciador-de-tarefas.jar
WORKDIR /usr/app
CMD ["java", "-jar", "gerenciador-de-tarefas.jar"]
