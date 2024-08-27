pipeline {
    agent any

    environment {
        // Default values for properties
        PROPERTY1 = ''
        PROPERTY2 = ''
    }

    stages {
        stage('Read Properties') {
            steps {
                script {
                    // Read properties from gradle.properties
                    def props = readFile('gradle.properties').trim()

                    // Initialize a map to hold properties
                    def propertiesMap = [:]

                    // Split properties into key-value pairs
                    props.split('\n').each { line ->
                        def pair = line.split('=')
                        if (pair.length == 2) {
                            propertiesMap[pair[0].trim()] = pair[1].trim()
                        }
                    }

                    // Set environment variables
                    env.PROPERTY1 = propertiesMap['artifactoryURL'] ?: 'defaultURL'
                    env.PROPERTY2 = propertiesMap['artifactoryRepo'] ?: 'defaultRepo'
                    
                    // Debugging: print properties
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
                    // Pass the properties as parameters to the Gradle build
                    sh "./gradlew build -PartifactoryURL=${env.PROPERTY1} -PartifactoryRepo=${env.PROPERTY2}"
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
