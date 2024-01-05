### Using fabric8 maven plugin for docker
Adding following plugin in pom.xml
```
            <plugin>
                <groupId>io.fabric8</groupId>
                <artifactId>docker-maven-plugin</artifactId>
                <version>0.36.0</version>
                <configuration>
                    <images>
                        <image>
                            <name>allthatjava/${project.artifactId}</name>
                            <build>
                                <from>openjdk:8-jre</from>
                                <assembly>
                                    <descriptorRef>artifact</descriptorRef>
                                    <targetDir>/</targetDir>
                                </assembly>
                                <ports>
                                    <port>8080/tcp</port>
                                </ports>
                            </build>
                        </image>
                    </images>
                </configuration>
            </plugin>
```
And have /Dockerfile something like this
```
FROM openjdk:8-jre
EXPOSE 8080
ADD target/boot-example-docker-with-maven.jar boot-example-docker-with-maven.jar
ENTRYPOINT ["java", "-jar", "/boot-example-docker-with-maven.jar"]
```

### Run command
* To build the docker image
```
mvn clean package docker:build
```
* To push the docker image to Docker Hub
```
mvn docker:push
```