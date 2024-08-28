pipeline {
    agent any

    parameters {
        string(name: 'ARTIFACTORY_URL', defaultValue: 'defaultURL', description: 'Artifactory URL')
        string(name: 'ARTIFACTORY_REPO', defaultValue: 'defaultRepo', description: 'Artifactory Repository')
        string(name: 'ARTIFACTORY_USER', defaultValue: 'defaultUser', description: 'Artifactory User')
        string(name: 'ARTIFACTORY_PASSWORD', defaultValue: 'defaultPassword', description: 'Artifactory Password')
    }

    environment {
   ARTIFACTORY_URL = "${params.ARTIFACTORY_URL}"
           ARTIFACTORY_REPO ="${params.ARTIFACTORY_REPO}"
           ARTIFACTORY_USER ="${params.ARTIFACTORY_USER}"
        ARTIFACTORY_PASSWORD= "${params.ARTIFACTORY_PASSWORD}"
    }
    stages {
        stage('Read Properties') {
            steps {
                script {
                    // Print the parameters to verify they're being passed correctly
                    echo "ARTIFACTORY_URL: ${params.ARTIFACTORY_URL}"
                    echo "ARTIFACTORY_REPO: ${params.ARTIFACTORY_REPO}"
                    echo "ARTIFACTORY_USER: ${params.ARTIFACTORY_USER}"
                    echo "ARTIFACTORY_PASSWORD: ${params.ARTIFACTORY_PASSWORD}"

                    // // Optionally, you can also set them as environment variables
                    // env.PROPERTY1 = params.ARTIFACTORY_URL
                    // env.PROPERTY2 = params.ARTIFACTORY_REPO
                    // env.PROPERTY3 = params.ARTIFACTORY_USER
                    // env.PROPERTY4 = params.ARTIFACTORY_PASSWORD
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    // Pass the parameters as command-line arguments to Gradle
                    sh '''
                    ./gradlew build \
                    -PartifactoryURL=${ARTIFACTORY_URL} \
                    -PartifactoryRepo=${ARTIFACTORY_REPO} \
                          -PartifactoryUser=${ARTIFACTORY_USER} \
                                -PartifactoryPassword=${ARTIFACTORY_PASSWORD} 
                
                    '''
                }
            }
        }

        stage('Upload to Artifactory') {
             steps {
                 sh 'pwd'
                 sh 'cd build/libs/'
                 sh 'ls -l'
                 sh './gradlew artifactoryPublish'
             }
         }
    }

    post {
        always {
            cleanWs()
        }
    }
}
