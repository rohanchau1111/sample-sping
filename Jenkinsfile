pipeline {
    agent any
environment {
  choice(name: 'REPO_NAME', choices: ['gradle-dev-local', 'repo2', 'repo3'], description: 'Select the repository to build')
    user =credentials('artifactorycreds')
	}
    stages {


        stage('Build') {
            steps {
                script {
                
                   sh '''
                        chmod +x gradlew
                        echo '${user}'
                        ./gradlew clean build -Partifactorycreds=${user} 
                    '''
                 
                    
                }
            }
        }
      
        stage('Upload to Artifactory') {
             steps {
                 sh 'pwd'
                 //sh 'cd build/libs/'
                 sh 'ls -l'
                 sh './gradlew artifactoryPublish'
             }
         }
    }


}
