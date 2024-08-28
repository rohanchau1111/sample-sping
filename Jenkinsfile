pipeline {
    agent any
    
    environment {
        ARTIFACTORY_URL = ''
        ARTIFACTORY_REPO = ''
        ARTIFACTORY_USER = ''
        ARTIFACTORY_PASSWORD = ''
        BRANCH_ID = ''
    }
    
    stages {
        stage('Read Properties') {
            steps {
                script {
                    // Read the properties file
                    def props = readProperties file: 'gradle.properties'
                    
                    // Set environment variables from properties
                    env.ARTIFACTORY_URL = props.artifactURL
                    env.ARTIFACTORY_REPO = props.artifactRepo
                    env.ARTIFACTORY_USER = props.artifactoryUser
                    env.ARTIFACTORY_PASSWORD = props.artifactoryPassword
                    env.BRANCH_ID = props.branchId
                }
            }
        }
        
        stage('Run Gradle Build') {
            steps {
                script {
                    // Pass the properties as command-line arguments to Gradle
                    sh '''
                        chmod +x gradlew
                        echo '---'
                        # Print the properties for debugging
                        echo "Artifactory URL: ${ARTIFACTORY_URL}"
                        echo "Artifactory Repo: ${ARTIFACTORY_REPO}"
                        echo "Artifactory User: ${ARTIFACTORY_USER}"
                        echo "Artifactory Password: ${ARTIFACTORY_PASSWORD}"
                        echo "Branch ID: ${BRANCH_ID}"
                        
                        # Run Gradle build with properties
                        ./gradlew clean build \
                            -PartifactURL=${ARTIFACTORY_URL} \
                            -PartifactRepo=${ARTIFACTORY_REPO} \
                            -PartifactoryUser=${ARTIFACTORY_USER} \
                            -PartifactoryPassword=${ARTIFACTORY_PASSWORD} \
                            -PbranchId=${BRANCH_ID}
                    '''
                }
            }
        }
    }
}
