FROM openjdk:8-jre

EXPOSE 8080

ADD target/boot-example-docker-with-maven.jar boot-example-docker-with-maven.jar

ENTRYPOINT ["java", "-jar", "/boot-example-docker-with-maven.jar"]