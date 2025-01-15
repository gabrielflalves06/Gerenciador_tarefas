# Usar a imagem oficial do OpenJDK
FROM openjdk:17-jdk-slim

# Definir o diretório de trabalho dentro do container
WORKDIR /app

# Copiar o arquivo JAR gerado pelo Maven para o container
COPY target/GerenciadorDeTarefas.jar app.jar

# Configurar o comando de inicialização
CMD ["java", "-jar", "app.jar"]
