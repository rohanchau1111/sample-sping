//  checkout BbS(branches: [[name: '*/feature/identity_liberty_test']], credentialsId: 'bitbucket-rohan', extensions: [], id: 'a280518a-e9d2-40f7-912b-dc607ff921d8', mirrorName: '', projectName: 'PEM', repositoryName: 'identity-service', serverId: '53ce335b-2ec9-43a6-9f84-9de1da3cab99', sshCredentialsId: 'bitbucket-Rohan')

   // stage('Build') {
   //          steps {
   //              // Run Gradle build with the property passed as a parameter
   //              script {
   //                  def propertyValue = params.propertyName
   //                  sh "./gradlew build -PpropertyName=${propertyValue}"
   //              }
   //          }
   //      }

pipeline {
    agent any
  
     //environment {
     // ARTIFACTORY_SERVER_ID='abcd'
      //ARTIFACTORY_REPO='gradle-release-loca'
   //   ARTIFACTORY_CREDENTIALS='artifactorycreds'
         
     //}
     
    stages {
        stage('clone') {
             steps {
            
             checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/rohanchau1111/sample-sping.git']])   
   //      //  git branch: 'main', url: 'https://github.com/appuio/example-spring-boot-helloworld.git'
   // //  checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/appuio/example-spring-boot-helloworld.git']])   
               sh 'ls -l'
                 sh 'sudo chmod 777 *'
                
             }
         }
        
         stage('clean') {
            steps {
                sh 'ls -la'
           
                sh 'sudo ./gradlew  clean'
            //   sh './gradlew bootJar'
             //  archiveArtifacts artifacts: 'build/libs/*.jar', followSymlinks: false
            }
        }
        
           stage('build') {
            steps {
                sh 'ls -la'
             //   sh 'sudo  ls -la /root/.gradle/caches/modules-2/files-2.1/ch.appuio.techlab/artifactorytest/'
              sh 'sudo ./gradlew  build'
          //    sh 'sudo ./gradlew artifactoryPublish'
             //  archiveArtifacts artifacts: 'build/libs/*.jar', followSymlinks: false
             //sh 'sudo ./gradlewJar'
             //  archiveArtifacts artifacts: 'build/libs/*.jar', followSymlinks: false
            }
        }
        
        
        //     stage ('Upload file') {
        //     steps {
        //         rtUpload (
        //             // Obtain an Artifactory server instance, defined in Jenkins --> Manage Jenkins --> Configure System:
        //             serverId: My_Artifactory,
        //             spec: """{
        //                     "files": [
        //                             {
        //                                 "pattern": "build/libs/*.jar",
        //                                 "target": "gradle-dev-local"
        //                             }
        //                         ]
        //                     }"""
        //         )
        //     }
        // }
     stage('Upload to arthifact') {
          
               steps{
        //    sh 'pwd'
        //     sh 'cd build/libs/'
        //         sh 'ls -l'
        //       //  sh 'sudo ./gradlew deleteUnwantedFiles'
                   sh 'sudo ./gradlew artifactoryPublish'
        //        //   script {
                      
        //         //       def server= Artifactory.server(ARTIFACTORY_SERVER_ID)
        //         //       def uploadSpec= """{
        //         //           "files": [
        //         //           {
                             
        //         //              "pattern": "build/libs/*.jar",
        //         //              "target": "${ARTIFACTORY_REPO}/"
                          
        //         //           }
        //         //           ]
        //         //       }"""
        //         //       server.upload(uploadSpec)
        //         //   }  
                  
                  
            // }
              
             
        }
    }
    
// post{
       
//       always{
//           cleanWs()
//       }
       
//  }












// pipeline {
//     agent any
 
//     parameters {
//         string(name: 'BRANCH_NAME', defaultValue: 'feature/identity_liberty_test', description: 'Branch name to checkout')
//         string(name: 'REPOSITORY_NAME', defaultValue: 'identity-service', description: 'Repository name')
//         string(name: 'PROJECT_NAME', defaultValue: 'PEM', description: 'Project name')
//     }
 
//     stages {
//         stage('Checkout from Bitbucket') {
//             steps {
//                 script {
//                     bbs_checkout (
//                         projectName: "${params.PROJECT_NAME}",
//                         repositoryName: "${params.REPOSITORY_NAME}",
//                         branches: [[name: "*/${params.BRANCH_NAME}"]],
//                         credentialsId: 'bitbucket-rohan',
//                         sshCredentialsId: 'bitbucket-Rohan',
//                         serverId: '53ce335b-2ec9-43a6-9f84-9de1da3cab99'
//                     )
//                 }
//             }
//         }
 
//         stage('Read and Export Properties') {
//             steps {
//                 script {
//                     // Shell script to read and export properties
//                     sh '''
//                         #!/bin/bash
//                         trim() {
//                             local var="$1"
//                             var="${var#"${var%%[![:space:]]*}"}"   # remove leading whitespace characters
//                             var="${var%"${var##*[![:space:]]}"}"   # remove trailing whitespace characters
//                             echo -n "$var"
//                         }
 
//                         while IFS='=' read -r key value; do
//                             if [[ ! -z "$key" && ! "$key" =~ ^# ]]; then
//                                 key=$(trim "$key")
//                                 value=$(trim "$value")
//                                 export $key="$value"
//                             fi
//                         done < gradle.properties
 
                      
//                          chmod +x gradlew
                         
//                          echo '---'
//                           # Print the properties for debugging
//                         echo "Artifactory URL: $artifactoryURL"
//                         echo "Artifactory Repo: $artifactoryRepo"
//                         echo "Artifactory User: $artifactoryUser"
//                         echo "Artifactory Password: $artifactoryPassword"
//                         echo "Branch ID: $branchId"
                     
                     
//                       chmod +x gradlew
//                      ./gradlew clean build \
//                             -PartifactoryURL=$artifactoryURL \
//                             -PartifactoryRepo=$artifactoryRepo \
//                             -PartifactoryUser=$artifactoryUser \
//                             -PartifactoryPassword=$artifactoryPassword \
//                             -PbranchId=$branchId
//                     '''
                  
//                 }
//             }
//         }
 
//     }
// }

 
