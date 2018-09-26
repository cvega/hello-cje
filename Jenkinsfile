@Library('zendesk-jenkins') _

pipeline {
  agent any
  environment {
    GCB_CREDENTIALS = credentials('test')
  }
  stages {
    stage('build') {
      parallel {
        stage('Google Cloud Build') {
          steps {
            gcb(credentialsId: GCB_CREDENTIALS, source: "test")
          }
        }
        stage('Travis-CI') {
          steps {
            echo "Travis would run here"
          }
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
