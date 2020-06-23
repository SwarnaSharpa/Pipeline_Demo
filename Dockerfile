
FROM tomcat:8.5-jdk8
RUN ln -s /usr/local/tomcat/webapps.dist/manager webapps/manager
RUN ln -s /usr/local/tomcat/webapps.dist/host-manager webapps/host-manager
RUN ln -s /usr/local/tomcat/webapps.dist/ROOT webapps/ROOT
COPY target/practicewebapp-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/practiceweb.war
CMD ["catalina.sh", "run"]



