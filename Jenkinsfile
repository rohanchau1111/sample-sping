pipeline {
    agent any
    parameters {
         choice(name: 'REPO_NAME', choices: ['gradle-dev-local'])
        
    }
environment {
 
ARTIFACTORY_REPO = "${params.REPO_NAME}"
}

    stages {
        stage('Build') {
            steps {
                script {
              def artifactoryCreds= credentials('articred')
                   def artifactoryUser = artifactoryCreds.username
                   def artifactoryPassword = artifactoryCreds.password

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

        stage('Upload to Artifactory') {
            steps {
                sh 'pwd'
                sh 'ls -l'
                sh './gradlew artifactoryPublish'
            }
        }
    }
}
