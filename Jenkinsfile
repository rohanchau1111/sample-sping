pipeline {
    agent any

    environment {
        // Default values, will be overwritten by properties if available
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
                    def props = new Properties()
                    def propsFile = new File("${JENKINS_HOME}/workspace/${JOB_NAME}/gradle.properties")

                    if (propsFile.exists()) {
                        propsFile.withInputStream { stream ->
                            props.load(stream)
                        }

                        // Set environment variables from properties
                        env.ARTIFACTORY_URL = props.getProperty('artifactURL', '')
                        env.ARTIFACTORY_REPO = props.getProperty('artifactRepo', '')
                        env.ARTIFACTORY_USER = props.getProperty('artifactoryUser', '')
                        env.ARTIFACTORY_PASSWORD = props.getProperty('artifactoryPassword', '')
                        env.BRANCH_ID = props.getProperty('branchId', '')
                    } else {
                        error 'gradle.properties file not found'
                    }
                }
            }
        }

        stage('Run Gradle Build') {
            steps {
                script {
                    // Ensure the gradlew script has execution permissions
                    sh 'chmod +x gradlew'
                    
                    // Print environment variables for debugging
                    sh '''
                        echo "Artifactory URL: ${ARTIFACTORY_URL}"
                        echo "Artifactory Repo: ${ARTIFACTORY_REPO}"
                        echo "Artifactory User: ${ARTIFACTORY_USER}"
                        echo "Artifactory Password: ${ARTIFACTORY_PASSWORD}"
                        echo "Branch ID: ${BRANCH_ID}"
                    '''
                    
                    // Run Gradle build with environment variables
                    sh '''
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
