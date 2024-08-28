pipeline {
    agent any
parameters{
  choice(name: 'REPO_NAME', choices: ['gradle-dev-local', 'repo2', 'repo3'], description: 'Select the repository to build')
}
	environment {

    user =credentials('artifactorycreds')
     repourl= credentials('repourl')
	}
    stages {


        stage('Build') {
            steps {
                script {
                  def repoName = params.REPONAME
			echo '==============${repoName}'
                   sh '''
                        chmod +x gradlew
                        echo '${user}'
                        ./gradlew clean build 
			-Prepourl=${repourl} 
   	                -Prepouser=${user} 
    	                
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
