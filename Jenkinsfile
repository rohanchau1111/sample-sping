//  checkout BbS(branches: [[name: '*/feature/identity_liberty_test']], credentialsId: 'bitbucket-rohan', extensions: [], id: 'a280518a-e9d2-40f7-912b-dc607ff921d8', mirrorName: '', projectName: 'PEM', repositoryName: 'identity-service', serverId: '53ce335b-2ec9-43a6-9f84-9de1da3cab99', sshCredentialsId: 'bitbucket-Rohan')
pipeline {
    agent any
  
     //environment {
     // ARTIFACTORY_SERVER_ID='abcd'
      //ARTIFACTORY_REPO='gradle-release-loca'
   //   ARTIFACTORY_CREDENTIALS='artifactorycreds'
         
     //}
     
    stages {
   //      stage('clone') {
   //          steps {
            
   //          checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/rohanchau1111/sample-sping.git']])   
   //      //  git branch: 'main', url: 'https://github.com/appuio/example-spring-boot-helloworld.git'
   // //  checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/appuio/example-spring-boot-helloworld.git']])   
   //            sh 'ls -l'
   //              sh 'sudo chmod 777 *'
                
   //          }
   //      }
        
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
              sh 'sudo ./gradlew artifactoryPublish'
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
    // stage('Upload to arthifact') {
          
      //         steps{
        //    sh 'pwd'
        //     sh 'cd build/libs/'
        //         sh 'ls -l'
        //       //  sh 'sudo ./gradlew deleteUnwantedFiles'
          //         sh 'sudo ./gradlew artifactoryPublish'
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
 

 
