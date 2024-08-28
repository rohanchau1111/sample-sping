pipeline {
    agent any

    // parameters {
    //     string(name: 'ARTIFACTORY_URL', defaultValue: 'defaultURL', description: 'Artifactory URL')
    //     string(name: 'ARTIFACTORY_REPO', defaultValue: 'defaultRepo', description: 'Artifactory Repository')
    //     string(name: 'ARTIFACTORY_USER', defaultValue: 'defaultUser', description: 'Artifactory User')
    //     string(name: 'ARTIFACTORY_PASSWORD', defaultValue: 'defaultPassword', description: 'Artifactory Password')
    // }

    //  environment {
    //        ARTIFACTORY_URL = "${params.ARTIFACTORY_URL}"
    //        ARTIFACTORY_REPO ="${params.ARTIFACTORY_REPO}"
    //        ARTIFACTORY_USER ="${params.ARTIFACTORY_USER}"
    //        ARTIFACTORY_PASSWORD= "${params.ARTIFACTORY_PASSWORD}"
    // } 
    stages {
      stage('Read and Export Properties') {
            steps {
                script {
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
 
        stage('Run Gradle Build') {
            steps {
                script {
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
      
        stage('Upload to Artifactory') {
             steps {
                 sh 'pwd'
                 //sh 'cd build/libs/'
                 sh 'ls -l'
                 sh './gradlew artifactoryPublish'
             }
         }
    }


}
