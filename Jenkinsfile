@Library('zendesk-jenkins') _

pipeline {
  agent any
  stages {
    stage('build') {
      failFast true
      parallel {
        stage('Google Cloud Build') {
          steps {
            gcb(credentialsId: "perbranch", cloudBuildFile: "cloudbuild.yaml")
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
