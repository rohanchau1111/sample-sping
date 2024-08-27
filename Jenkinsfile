pipeline {
    agent any
  
     environment {
     PROPERTY1 = ''
     PROPERTY2 = ''
          
         
         // ARTIFACTORY_SERVER_ID='abcd'
      //ARTIFACTORY_REPO='gradle-release-loca'
   //   ARTIFACTORY_CREDENTIALS='artifactorycreds'
         
     }
     
    stages {
   //      stage('clone') {
   //          steps {
            
   //          checkout scmGit(branches: [[name: '*/feature']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/rohanchau1111/sample-sping.git']])   
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
             script{
                 
                def properties = readProperties file: 'gradle.properties'
                 env.PROPERTY1 = properties['artifactoryURL']


                 echo '${env.PROPERTY1}'
 
                    
              sh 'sudo ./gradlew  build -PartifactoryURL=${env.PROPERTY1}'
             //  archiveArtifacts artifacts: 'build/libs/*.jar', followSymlinks: false
             //sh 'sudo ./gradlewJar'
             //  archiveArtifacts artifacts: 'build/libs/*.jar', followSymlinks: false
            }
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
               sh 'pwd'
                sh 'cd build/libs/'
                sh 'ls -l'
              //  sh 'sudo ./gradlew deleteUnwantedFiles'
                  sh 'sudo ./gradlew artifactoryPublish'
                //   script {
                      
                //       def server= Artifactory.server(ARTIFACTORY_SERVER_ID)
                //       def uploadSpec= """{
                //           "files": [
                //           {
                             
                //              "pattern": "build/libs/*.jar",
                //              "target": "${ARTIFACTORY_REPO}/"
                          
                //           }
                //           ]
                //       }"""
                //       server.upload(uploadSpec)
                //   }  
                  
                  
              }
              
             
        }
    }
    }
// post{
       
//       always{
//           cleanWs()
//       }
       
//  }
 

 
