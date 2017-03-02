FROM padcom/busybox-java:8u121
MAINTAINER Matthias Hryniszak <padcom@gmail.com>

RUN opkg-install curl

RUN mkdir -p /usr/lib/jvm && \
    curl http://archive.apache.org/dist/tomcat/tomcat-8/v8.5.11/bin/apache-tomcat-8.5.11.tar.gz -L -k | gzip -dc | tar -xf - -C /opt && \
    ln -s /opt/apache-tomcat-8.5.11 /opt/tomcat && \
    rm -rf /opt/tomcat/webapps/*

CMD [ "/opt/tomcat/bin/catalina.sh", "run" ]

EXPOSE 8080
