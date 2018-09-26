@Library('zendesk-jenkins') _

pipeline {
    agent any
    stages {
        parallel {
              stage('Google Cloud Build') {
                  steps {
                    echo "GCB would be run here"
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
