def artifactRepoList = ['gradle-dev-local','libs-snapshot-local', 'libs-release-local']

def getArtifactRepo() {
    if (params.ARTIFACTORY_REPOSITORY) {
        // Entered parameter if set
        return params.ARTIFACTORY_REPOSITORY
    } else {
        // Default to first item in list otherwise
        return artifactRepoList[0]
    }
}
pipeline {
    agent any

    parameters {
     
          choice(name: 'ARTIFACTORY_REPOSITORY', choices: artifactRepoList)
    }

    environment {
        ARTIFACTORY_URL = 'http://172.27.225.231:8082/artifactory'
        ARTIFACTORY_CREDS = credentials('articred') // Ensure this credential ID exists in Jenkins
        //ARTIFACTORY_REPO = "${params.REPO_NAME}"
        ARTIFACTORY_REPOSITORY = getArtifactRepo()    
    }

    stages {
        stage('Build and Clean') {
            steps {
                script {
                    // Construct the repository URL
                    def repoUrl = "${env.ARTIFACTORY_URL}"
                   def branchId = env.GIT_BRANCH
                    echo "the branch id is : ${branchId}"
                    // Ensure the Gradle wrapper is executable
                    sh 'chmod +x gradlew'

                    // Pass the credentials and repository name to the Gradle build
                    sh """
                        ./gradlew clean build artifactoryPublish \\
                        -PartifactoryURL=${repoUrl} \\
                        -PartifactoryRepo=${env.ARTIFACTORY_REPOSITORY} \\
                        -PartifactoryUser=${ARTIFACTORY_CREDS_USR} \\
                        -PartifactoryPassword=${ARTIFACTORY_CREDS_PSW} 
                    """
                }
            }
        }
            stage('Test') {
            steps {
                script {
                    sh './gradlew test'
                }
            }
        }

        stage('Code Coverage') {
            steps {
                script {
                    sh './gradlew jacocoTestReport'
                }
            }
        }
    }
    post{

 success{
   jacoco()
 }
    }
}
