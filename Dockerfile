FROM maven:3.8.4-openjdk-17 as BUILD

ADD ./pom.xml pom.xml
ADD ./src src/

RUN mvn clean -DskipTests=true package

FROM openjdk:17

COPY --from=BUILD /target/*.jar /e-shop.jar

ENTRYPOINT ["java","-jar","e-shop.jar"]

