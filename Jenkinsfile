pipeline {
    agent any
  
    parameters {
       // string(name: 'AGENT_LABEL', defaultValue: 'b2bi-build-03', description: 'Agent for build')
         choice(name: 'REPO_NAME', choices: ['gradle-dev-local'])
    }

     
    stages {
        stage('clone') {
             steps {
            
             checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/rohanchau1111/sample-sping.git']])   
               sh 'ls -l'
                 sh 'sudo chmod 777 *'
                
             }
         }
        
         stage('clean') {
            steps {
                sh 'ls -la'
                sh 'sudo ./gradlew  clean'
            }
        }
        
           stage('build') {
            steps {
                sh 'ls -la'
             //   sh 'sudo  ls -la /root/.gradle/caches/modules-2/files-2.1/ch.appuio.techlab/artifactorytest/'
              sh 'sudo ./gradlew  build artifactoryPublish  -PartifactoryRepo=${params.REPO_NAME}'
          //    sh 'sudo ./gradlew artifactoryPublish'
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
    }
}
