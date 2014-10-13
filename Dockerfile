FROM dockerfile/java:oracle-java8
MAINTAINER Urs Breu <ubreu@gleisdrei.ch>

ENV TOMCAT_MAJOR_VERSION 7
ENV TOMCAT_MINOR_VERSION {TOMCAT_MAJOR_VERSION}.0.56
ENV CATALINA_HOME /opt/tomcat

RUN wget -q https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz && \
    wget -qO- https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 | md5sum -c - && \
    tar zxf apache-tomcat-*.tar.gz && \
    rm apache-tomcat-*.tar.gz && \
    mv apache-tomcat* tomcat

RUN rm -rf ${CATALINA_HOME}/webapps/examples ${CATALINA_HOME}/webapps/docs 

ADD run.sh /run.sh
RUN chmod +x /run.sh

ONBUILD ADD *.war ${CATALINA_HOME}/webapps/

VOLUME ["${CATALINA_HOME}/logs", "${CATALINA_HOME}/work", "{CATALINA_HOME}/temp" ]

EXPOSE 8080
CMD ["/run.sh"]
