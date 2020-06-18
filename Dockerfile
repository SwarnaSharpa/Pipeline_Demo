FROM tomcat:latest
COPY target/*.war /usr/local/tomcat/webapps/practiceweb.war
