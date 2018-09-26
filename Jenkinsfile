@Library('zendesk-jenkins') _

pipeline {
  agent any
  stages {
    stage('build') {
      parallel {
        stage('Google Cloud Build') {
          steps {
            echo "GCB time"
            gcb(credentials: "test", source: "test")
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
