# Etapa de construção
FROM ubuntu:latest AS build

# Atualizar pacotes e instalar OpenJDK 17 e Maven
RUN apt-get update && apt-get install -y openjdk-17-jdk maven && apt-get clean

# Definir o diretório de trabalho
WORKDIR /app

# Copiar o código fonte para o contêiner
COPY . .

# Rodar a construção do Maven
RUN mvn clean install

# Etapa final para a aplicação
FROM openjdk:17-jdk-slim

# Expor a porta 8080 para acesso externo
EXPOSE 8080

# Copiar o JAR gerado da etapa de construção
COPY --from=build /app/target/GerenciadorDeTarefas-0.0.1-SNAPSHOT.jar /app/app.jar

# Definir o comando de entrada para executar o JAR
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
