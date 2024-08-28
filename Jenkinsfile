pipeline {
    agent { label "${params.AGENT_LABEL}" }

    parameters {
        string(name: 'AGENT_LABEL', defaultValue: 'b2bi-build-03', description: 'Agent for build')
        choice(name: 'REPO_NAME', choices: ['gradle-dev-local'], description: 'Select the Artifactory Repository')
        credentials(name: 'ARTIFACTORY_CREDS', type: 'username-password', required: true, description: 'Artifactory Credentials')
    }

    environment {
        // Environment variables for repository and credentials
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
