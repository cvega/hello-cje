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
          }
    }
}