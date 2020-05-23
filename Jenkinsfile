pipeline {
     environment {
    	registry = "aymanazzam07/todo-app"
    	registryCredential = 'dockerhub'
	dockerImage = ''
     }
     agent none
    
     stages {
         stage('Linting') {
	      agent any
              steps {
		 sh '''
			npm install jsonlint -g
			jsonlint todo-app/cypress.json
			jsonlint todo-app/package.json
		 '''
              }
         }
	 stage('Build Image') {
	      agent any
              steps {
                 dockerImage = docker.build registry + ":latest"
              }
         }
	 stage('Push Image') {
  	      steps {    
		script {
      			docker.withRegistry( '', registryCredential ){ dockerImage.push() }
    		}
  	      }
	 stage('Deploy Container') {
	      agent any
              steps {
		 sh 'kubectl run api --image=aymanazzam07/todo-app:latest --port=1024'
              }
         }
     }
}
