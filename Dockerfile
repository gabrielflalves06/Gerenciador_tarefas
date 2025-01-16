# Use a imagem base do Java 17
FROM openjdk:17-jdk-slim

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo JAR gerado para o contêiner
COPY target/GerenciadorDeTarefas-0.0.1-SNAPSHOT.jar app.jar

# Expõe a porta usada pelo Spring Boot
EXPOSE 8080

# Comando para iniciar o aplicativo
ENTRYPOINT ["java", "-jar", "app.jar"]
