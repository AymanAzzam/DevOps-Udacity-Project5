pipeline {
     agent none
    
     stages {
         stage('Lint') {
	      agent {
		 docker {
		 	image 'darrylb/jsonlint' 		  
            		args '-u root:root'
		 }		         
      	      }
              steps {
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
