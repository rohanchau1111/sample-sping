pipeline {
    agent any
    parameters {
      
         choice(name: 'REPO_NAME', choices: ['gradle-dev-local'])
    }
environment {
 
 ARTIFACTORY_USER =  credentials('articred').username
    
ARTIFACTORY_PASSWORD = credentials('articred').password
ARTIFACTORY_REPO = "${params.REPO_NAME}"
}
    stages {
        stage('Build') {
            steps {
                script {
                  sh 'chmod +x gradlew'
                       sh """

./gradlew clean build artifactoryPublish \\
 -PartifactoryRepo=${ARTIFACTORY_REPO}" \\
 -PartifactoryUser=${ARTIFACTORY_USER}" \\
-PartifactoryPassword=${ARTIFACTORY_PASSWORD}"
 
   """    
                    
            
                }
            }
        }

        stage('Upload to Artifactory') {
            steps {
                sh 'pwd'
                sh 'ls -l'
                sh './gradlew artifactoryPublish'
            }
        }
    }
}
