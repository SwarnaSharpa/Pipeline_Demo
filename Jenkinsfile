node{
    stage ('Git Checkout'){
	git 'https://github.com/SwarnaSharpa/Pipeline_Demo'
    }
    stage ('Maven Build'){
    	sh 'mvn clean package'
	}
    stage ('Build Docker Image'){
		sh 'docker build -t swarnadocker/practice_webapp:1.0.1 .'
	}
    stage ('Push Docker Image'){
		withCredentials([string(credentialsId: 'docker-hub-pwd', variable: 'dockerhubpwd')]) {
        sh "docker login -u swarnadocker -p ${dockerhubpwd}"
        } 
		sh 'docker push swarnadocker/practice_webapp:1.0.1'
	}
    stage ('Run Image To Another Web Server'){
	    sh label: '', script: '''if [ ! "$(docker ps -q -f name=practice_webapp)" ]; then
        if [ "$(docker ps -aq -f status=exited -f name=practice_webapp)" ]; then
        # cleanup
        docker stop practice_webapp
        docker rm practice_webapp
        fi
        fi'''
		def dockerRun = 'docker run -p 8080:8080 -d --name practice_webapp swarnadocker/practice_webapp:1.0.1'
		sshagent(credentials: ['ubuntukey']) {
      			sh "ssh -o StrictHostKeyChecking=no ubuntu@$WebServer ${dockerRun} "		
		}	        
	}
}
