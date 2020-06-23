# Pipeline_Demo
Cloud used - AWS

Prerequisites - 
1. Jenkins Instance : 
Packages installed - Java, Jenkins, Docker

2. Web Server Instance :
Packages installed - Docker  

 Steps - 

1. Open the url of the Jenkins server using {Jenkins Instance IP Address}:8080
2. Create a pipeline job and make it parametized, name the parameter as "WebServer" and provide the default value as the web server instance's ip address.
3. Scroll down to the Pipeline section and select Definition combo box as "Pipeline script"
and copy the contents of Jenkinsfile inside the Script section.
4. Below credentials from the script needs to be configured -  

a) docker-hub-pwd
b) ubuntukey

To configure above go to : http://{Jenkins Instance IP Address}:8080/credentials/store/system/domain/_/newCredentials

Now to create credential "docker-hub-pwd", select the "Kind" combo box as "Secret text" and provide your docker login password in the "Secret" field, provide the ID and description as "docker-hub-pwd" and save it.

To configure "ubuntukey", select the "Kind" combo box as "SSH Username with private key" and copy paste the content of pem file to login to the web server instance in the "Private Key" section by selecting the "Enter directly" radio button. Fill the ID and description as "ubuntukey" and provide the user name of the web server inside "Username" field(if you are using the ubuntu instance from AWS then username will be 'ubuntu'), save the credentials. 

That's it, we are done with the crendentials.

5. Have a look on the script which we have copied from the Jenkinsfile and replace 'swarnadocker' with your docker user name. Rest all will be the same. Save the job with updated script.

6. Run the pipeline job and verify that the WebServer parameter is displaying the correct ip address, hit build button.

7. If everything goes well, you can check your webapp running on the mentioned ip address of the web server. Verify the same using the url - http://{Web Server Instance IP Address}:8080/practicewebapp/

