

pipeline {
    agent any
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
