@Library('zendesk-jenkins') _

pipeline {
  agent any
  parameters {
    string(name: 'GCB_CREDENTIAL', defaultValue: 'perbranch')
    string(name: 'GCB_YAML', defaultValue: 'cloudbuild.yaml')
  }
  stages {
    stage('build') {
      failFast true
      parallel {
        stage('Google Cloud Build') {
          steps {
            gcb(credentialsId: "${params.GCB_CREDENTIAL}", cloudBuildFile: ${params.GCB_YAML})
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

