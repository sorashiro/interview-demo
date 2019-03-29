FROM java:8-jre-alpine AS build-env

WORKDIR /app

COPY index.jsp /app/index.jsp

RUN jar -cvf hello.war /app/index.jsp

FROM tomcat:8-alpine

COPY --from=build-env /app/hello.war /usr/local/tomcat/webapps/hello.war
