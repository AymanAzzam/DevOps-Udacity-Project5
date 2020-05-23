pipeline {
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
	 stage('Build image') {
	      agent any
              steps {
                 sh 'docker build --tag aymanazzam07/todo-app:latest .'
              }
         }
	 stage('Push image') {
	      agent any
              steps {
		 sh '''
			docker push aymanazzam07/todo-app
		 '''
              }
         }
	 stage('Deploy container') {
	      agent any
              steps {
		 sh 'kubectl run api --image=aymanazzam07/todo-app:latest --port=1024'
              }
         }
     }
}
