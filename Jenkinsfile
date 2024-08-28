pipeline {
    agent any

    stages {


        stage('Build') {
            steps {
                script {
                
                   sh '''
                        chmod +x gradlew
                        ./gradlew clean build 
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
