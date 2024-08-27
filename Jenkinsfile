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
                    echo "PROPERTY1: ${env.PROPERTY1}"
                    echo "PROPERTY2: ${env.PROPERTY2}"
                }
            }
        }

        stage('Clean') {
            steps {
                sh 'ls -la'
                sh './gradlew clean' // Removed 'sudo' as it's generally not needed in Jenkins
            }
        }

        stage('Build') {
            steps {
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
                sh './gradlew artifactoryPublish' // Removed 'sudo' as it's generally not needed in Jenkins
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
