# Use a imagem base do OpenJDK 17
FROM openjdk:17-jdk-slim

# Defina o diretório de trabalho no contêiner
WORKDIR /app

# Copie o arquivo .jar para dentro do contêiner no diretório /app
COPY target/gerenciador-de-tarefas-0.0.1-SNAPSHOT.jar /app/gerenciador-de-tarefas.jar


# Comando para rodar o .jar ao iniciar o contêiner
ENTRYPOINT ["java", "-jar", "/app/gerenciador-de-tarefas.jar"]

# Porta que a aplicação vai expor
EXPOSE 8080
