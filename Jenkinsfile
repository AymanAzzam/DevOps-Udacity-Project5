pipeline {
     agent none
    
     stages {
         stage('Lint') {
	      agent any
              steps {
		 sh 'npm install jsonlint -g'
                 sh 'jsonlint todo-app/*.json'
              }
         }
	 stage('Build Docker') {
	      agent any
              steps {
                 sh 'docker build --tag todo-app .'
              }
         }
     }
}
