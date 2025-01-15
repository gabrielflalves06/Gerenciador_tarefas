# Usar a imagem oficial do OpenJDK
FROM openjdk:17-jdk-slim

# Definir o diretório de trabalho dentro do container
WORKDIR /app

# Copiar o JAR gerado
COPY target/*.jar app.jar

# Comando para rodar o backend
CMD ["java", "-jar", "app.jar"]
