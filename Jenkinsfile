pipeline {
    agent any

    environment {
        // Initialize default values
        PROPERTY1 = ''
        PROPERTY2 = ''
    }

    stages {
        stage('Read Properties') {
            steps {
                script {
                    // Read and parse gradle.properties
                    def propsFile = 'gradle.properties'
                    def props = readFile(propsFile).trim()

                    // Initialize a map to hold properties
                    def propertiesMap = [:]

                    // Split properties into key-value pairs
                    props.split('\n').each { line ->
                        def pair = line.split('=')
                        if (pair.length == 2) {
                            propertiesMap[pair[0].trim()] = pair[1].trim()
                        }
                    }

                    // Set environment variables with default fallback
                    env.PROPERTY1 = propertiesMap['artifactoryURL'] ?: 'defaultURL'
                    env.PROPERTY2 = propertiesMap['artifactoryRepo'] ?: 'defaultRepo'

                    // Debugging: print environment variables
                    echo "PROPERTY1: ${env.PROPERTY1}"
                    echo "PROPERTY2: ${env.PROPERTY2}"
                }
            }
        }

        stage('Clean') {
            steps {
                sh 'ls -la'
                sh 'sudo ./gradlew clean'
            }
        }

        stage('Build') {
            steps {
                sh 'ls -la'
                script {
                    // Pass properties to Gradle build
                    sh """
                        echo "Building with ARTIFACTORY_URL: ${env.PROPERTY1} and ARTIFACTORY_REPO: ${env.PROPERTY2}"
                        sudo ./gradlew build -PartifactoryURL=${env.PROPERTY1} -PartifactoryRepo=${env.PROPERTY2}
                    """
                }
            }
        }

        stage('Upload to Artifactory') {
            steps {
                sh 'pwd'
                sh 'cd build/libs/'
                sh 'ls -l'
                sh 'sudo ./gradlew artifactoryPublish'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
