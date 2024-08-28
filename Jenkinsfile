pipeline {
    agent any
    parameters {
         choice(name: 'REPO_NAME', choices: ['gradle-dev-local'])
        
    }
environment {
ARTIFACTORY_CREDS = credentials('articred') 
ARTIFACTORY_REPO = "${params.REPO_NAME}"
}

    stages {
        stage('Build') {
            steps {
                script {
              
                   def artifactoryUser = ARTIFACTORY_CREDS_USR
                    
                   def artifactoryPassword =  ARTIFACTORY_CREDS_PSW

                    sh 'chmod +x gradlew'
                       sh """
./gradlew clean build artifactoryPublish \\
 -PartifactoryRepo=${ARTIFACTORY_REPO}" \\
 -PartifactoryUser=${artifactoryUser}" \\
-PartifactoryPassword=${artifactoryPassword}"
 
   """       
            
                }
            }
        }

        // stage('Upload to Artifactory') {
        //     steps {
        //         sh 'pwd'
        //         sh 'ls -l'
        //         sh './gradlew artifactoryPublish'
        //     }
        // }
    }
}
