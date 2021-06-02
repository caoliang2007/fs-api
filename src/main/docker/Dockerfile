FROM openjdk:8-jdk-alpine
VOLUME /webapps
ADD fs-api-*.jar /webapps/lib/fs-api.jar
RUN sh -c 'touch /webapps/lib/fs-api.jar'
ENV JAVA_OPTS=" -Xms1024m -Xmx1024m"
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /webapps/lib/fs-api.jar" ]

