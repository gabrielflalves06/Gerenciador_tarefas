# Use a imagem base do OpenJDK 17
FROM openjdk:17-jdk-slim

# Defina o diretório de trabalho no contêiner
WORKDIR /app

# Copie o arquivo .jar para dentro do contêiner no diretório /app
COPY target\GerenciadorDeTarefas-0.0.1-SNAPSHOT.jar /app/GerenciadorDeTarefas-0.0.1-SNAPSHOT.jar

# Comando para rodar o .jar ao iniciar o contêiner
ENTRYPOINT ["java", "-jar", "/app/GerenciadorDeTarefas-0.0.1-SNAPSHOT.jar"]

# Porta que a aplicação vai expor
EXPOSE 8080
