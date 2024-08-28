pipeline {
    agent any

    parameters {
        choice(name: 'REPO_NAME', choices: ['gradle-dev-local'], description: 'Select the Artifactory Repository')
    }

    environment {
        ARTIFACTORY_URL = 'http://172.27.225.231:8082/artifactory'
        ARTIFACTORY_CREDS = credentials('articred') // Ensure this credential ID exists in Jenkins
        ARTIFACTORY_REPO = "${params.REPO_NAME}"
        BRANCH_ID ="${env.BRANCH_NAME}"
    }

    stages {
        stage('Build and Clean') {
            steps {
                script {
                    // Construct the repository URL
                    def repoUrl = "${env.ARTIFACTORY_URL}"
                   def branchId = env.BRANCH_NAME
                    echo "the branch id is : ${branchId}"
                    // Ensure the Gradle wrapper is executable
                    sh 'chmod +x gradlew'

                    // Pass the credentials and repository name to the Gradle build
                    sh """
                        ./gradlew clean build artifactoryPublish \\
                        -PartifactoryURL=${repoUrl} \\
                        -PartifactoryRepo=${ARTIFACTORY_REPO} \\
                        -PartifactoryUser=${ARTIFACTORY_CREDS_USR} \\
                        -PartifactoryPassword=${ARTIFACTORY_CREDS_PSW} \\
                        -PbranchId=${BRANCH_ID}
                    """
                }
            }
        }
    }
}
