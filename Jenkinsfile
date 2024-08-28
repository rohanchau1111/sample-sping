pipeline {
    agent any

    parameters {
  
        choice(name: 'REPO_NAME', choices: ['gradle-dev-local'], description: 'Select the Artifactory Repository')
    }

    environment {
        ARTIFACTORY_CREDS = credentials('articred')
        ARTIFACTORY_REPO = "${params.REPO_NAME}"
    }

    stages {
        stage('Build and Clean') {
            steps {
                script {
                    // Pass the credentials and repository name to the Gradle build
                    sh """
                        ./gradlew clean build artifactoryPublish \\
                        -PartifactoryRepo=${ARTIFACTORY_REPO} \\
                        -PartifactoryUser=${ARTIFACTORY_CREDS_USR} \\
                        -PartifactoryPassword=${ARTIFACTORY_CREDS_PSW}
                    """
                }
            }
        }
    }
}
