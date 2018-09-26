@Library('zendesk-jenkins') _

pipeline {
  agent any
  environment {
    GCB_CREDENTIALS = credentials('perbranch')
  }
  stages {
    stage('build') {
      parallel {
        stage('Google Cloud Build') {
          steps {
            gcb(credentialsId: "perbranch", source: "test")
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
