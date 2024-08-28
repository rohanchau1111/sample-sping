pipeline {
    agent any
    parameters {
        choice(name: 'REPO_NAME', choices: ['gradle-dev-local', 'repo2', 'repo3'], description: 'Select the repository to build')
    }
    environment {
        ARTIFACTORY_CREDS = credentials('artifactorycreds')  // Combined username and password
        REPO_URL = credentials('repourl')  // Assuming repourl is stored as a secret text in Jenkins
    }
    stages {
        stage('Build') {
            steps {
                script {
                    // Extract username and password from combined credentials
                    def (username, password) = ARTIFACTORY_CREDS.split(':', 2)
                    def repoName = params.REPO_NAME
                    
                    sh """
                        chmod +x gradlew
                        ./gradlew clean build \
                        -PartifactoryUrl=${REPO_URL} \
                        -PartifactoryUser=${username} \
                        -PartifactoryPassword=${password} \
                        -PartifactoryRepo=${repoName}
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
