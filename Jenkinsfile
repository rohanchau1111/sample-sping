   stage('Read Properties') {
            steps {
                script {
                    // Read the properties file
                    def props = readProperties file: 'gradle.properties'
                    
                    // Set environment variables from properties
                    env.ARTIFACT_URL = props.artifactURL
                    env.ARTIFACT_REPO = props.artifactRepo
                    env.ARTIFACTORY_USER = props.artifactoryUser
                    env.ARTIFACTORY_PASSWORD = props.artifactoryPassword
                    env.BRANCH_ID = props.branchId
                }
            }
        }
@@ -1,53 +1,73 @@
pipeline {
    agent any

    parameters {
        string(name: 'ARTIFACTORY_URL', defaultValue: 'defaultURL', description: 'Artifactory URL')
        string(name: 'ARTIFACTORY_REPO', defaultValue: 'defaultRepo', description: 'Artifactory Repository')
        string(name: 'ARTIFACTORY_USER', defaultValue: 'defaultUser', description: 'Artifactory User')
        string(name: 'ARTIFACTORY_PASSWORD', defaultValue: 'defaultPassword', description: 'Artifactory Password')
    }
    // parameters {
    //     string(name: 'ARTIFACTORY_URL', defaultValue: 'defaultURL', description: 'Artifactory URL')
    //     string(name: 'ARTIFACTORY_REPO', defaultValue: 'defaultRepo', description: 'Artifactory Repository')
    //     string(name: 'ARTIFACTORY_USER', defaultValue: 'defaultUser', description: 'Artifactory User')
    //     string(name: 'ARTIFACTORY_PASSWORD', defaultValue: 'defaultPassword', description: 'Artifactory Password')
    // }

     environment {
           ARTIFACTORY_URL = "${params.ARTIFACTORY_URL}"
           ARTIFACTORY_REPO ="${params.ARTIFACTORY_REPO}"
           ARTIFACTORY_USER ="${params.ARTIFACTORY_USER}"
           ARTIFACTORY_PASSWORD= "${params.ARTIFACTORY_PASSWORD}"
    } 
    //  environment {
    //        ARTIFACTORY_URL = "${params.ARTIFACTORY_URL}"
    //        ARTIFACTORY_REPO ="${params.ARTIFACTORY_REPO}"
    //        ARTIFACTORY_USER ="${params.ARTIFACTORY_USER}"
    //        ARTIFACTORY_PASSWORD= "${params.ARTIFACTORY_PASSWORD}"
    // } 
    stages {
        stage('Read Properties') {
      stage('Read and Export Properties') {
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
                    // Shell script to read and export properties
                    sh '''
                        #!/bin/bash
                        trim() {
                            local var="$1"
                            var="${var#"${var%%[![:space:]]*}"}"   # remove leading whitespace characters
                            var="${var%"${var##*[![:space:]]}"}"   # remove trailing whitespace characters
                            echo -n "$var"
                        }
 
                        while IFS='=' read -r key value; do
                            if [[ ! -z "$key" && ! "$key" =~ ^# ]]; then
                                key=$(trim "$key")
                                value=$(trim "$value")
                                export $key="$value"
                            fi
                        done < gradle.properties
 
                        # Print the properties for debugging
                        echo "Artifactory URL: $artifactoryURL"
                        echo "Artifactory Repo: $artifactoryRepo"
                        echo "Artifactory User: $artifactoryUser"
                        echo "Artifactory Password: $artifactoryPassword"
                        echo "Branch ID: $branchId"
                    '''
                }
            }
        }

        stage('Build') {
 
        stage('Run Gradle Build') {
            steps {
                script {
                    // Pass the parameters as command-line arguments to Gradle
                   sh '''
                        chmod +x gradlew
                        ./gradlew clean build \
                        -PartifactoryURL=${ARTIFACTORY_URL} \
                        -PartifactoryRepo=${ARTIFACTORY_REPO} \
                        -PartifactoryUser=${ARTIFACTORY_USER} \
                        -PartifactoryPassword=${ARTIFACTORY_PASSWORD} 
                    
                    // Run Gradle build with properties
                    sh '''
                         chmod +x gradlew
                         
                         echo '---'
                          # Print the properties for debugging
                        echo "Artifactory URL: $artifactoryURL"
                        echo "Artifactory Repo: $artifactoryRepo"
                        echo "Artifactory User: $artifactoryUser"
                        echo "Artifactory Password: $artifactoryPassword"
                        echo "Branch ID: $branchId"
                       ./gradlew clean build \
                            -PartifactoryURL=$artifactoryURL \
                            -PartifactoryRepo=$artifactoryRepo \
                            -PartifactoryUser=$artifactoryUser \
                            -PartifactoryPassword=$artifactoryPassword \
                            -PbranchId=$branchId
                    '''


                }
            }
        }
