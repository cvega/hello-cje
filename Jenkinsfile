pipeline {
    agent none
    stages {
        parallel {
              stage('Google Cloud Build') {
                  steps {
                      googleCloudBuild \
                          credentialsId: 'docker-image-builder-179319',
                          source: local('.'),
                          request: file('cloudbuild.yaml'),
                  }
              }
              stage('Travis-CI') {
                steps {
                  echo "Travis would run here"
                }
              }
        }
        stage('Deploy to stage') {
          steps {
            echo "Run the samson webhook"
          }
        }
    }
}