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
        stage('Read Properties') {
            steps {
                script {
                    def props = readProperties  file:'rest-api/gradle.properties'
                   env.ARTIFACTORY_USER = props['artifactoryUser']
                      echo "ARTIFACTORY_URL : ${env.ARTIFACTORY_USER}" 
                //    echo "ARTIFACTORY_URL: ${params.ARTIFACTORY_URL}"
                  //  echo "ARTIFACTORY_REPO: ${params.ARTIFACTORY_REPO}"
                    //echo "ARTIFACTORY_USER: ${params.ARTIFACTORY_USER}"
                    //echo "ARTIFACTORY_PASSWORD: ${params.ARTIFACTORY_PASSWORD}"

                 
                }
            }
        }

        // stage('Build') {
        //     steps {
        //         script {
        //             // Pass the parameters as command-line arguments to Gradle
        //            sh '''
        //                 chmod +x gradlew
        //                 ./gradlew clean build \
        //                 -PartifactoryURL=${ARTIFACTORY_URL} \
        //                 -PartifactoryRepo=${ARTIFACTORY_REPO} \
        //                 -PartifactoryUser=${ARTIFACTORY_USER} \
        //                 -PartifactoryPassword=${ARTIFACTORY_PASSWORD} 
                    
        //             '''
                 
                    
        //         }
        //     }
        // }
      
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
