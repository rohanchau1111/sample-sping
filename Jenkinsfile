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
                    def propsFile = 'gradle.properties'
                    def props = readFile(propsFile).trim()

                    echo "Raw properties file content:"
                    echo props

                    def propertiesMap = [:]

                    // Split properties into key-value pairs
                    props.split('\n').each { line ->
                        def pair = line.split('=')
                        if (pair.length == 2) {
                            propertiesMap[pair[0].trim()] = pair[1].trim()
                        }
                    }

                    // Set environment variables with default values
                    env.PROPERTY1 = propertiesMap.get('artifactoryURL', 'defaultURL')
                    env.PROPERTY2 = propertiesMap.get('artifactoryRepo', 'defaultRepo')

                    // Debugging: print properties
                    echo "PROPERTY1 (from properties file): ${env.PROPERTY1}"
                    echo "PROPERTY2 (from properties file): ${env.PROPERTY2}"

                    // Verify the file path
                    sh "ls -la ${propsFile}"
                }
            }
        }

        stage('Clean') {
            steps {
                sh 'ls -la'
                sh './gradlew clean'
            }
        }

        stage('Build') {
            steps {
                script {
                    // Debugging: print environment variables before using them
                    echo "Environment Variable PROPERTY1: ${env.PROPERTY1}"
                    echo "Environment Variable PROPERTY2: ${env.PROPERTY2}"

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
