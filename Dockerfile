FROM tomcat:9.0.36
COPY target/*.war /usr/local/tomcat/webapps/practicewebapp.war
