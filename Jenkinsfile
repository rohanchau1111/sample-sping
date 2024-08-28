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
