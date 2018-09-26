@Library('zendesk-jenkins') _

pipeline {
  agent any
  parameters {
    string(name: 'GCB_CREDENTIAL', defaultValue: 'docker-image-builder-179319')
    string(name: 'GCB_YAML', defaultValue: 'cloudbuild.yaml')
    string(name: 'SAMSON_PAT', defaultValue: 'samson-pat-bcolfer')
  }
  stages {
    stage('build') {
      failFast true
      parallel {
        stage('Google Cloud Build') {
          steps {
            gcb(credentialsId: "${params.GCB_CREDENTIAL}", cloudBuildFile: "${params.GCB_YAML}")
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
      environment {
        SAMSON_TOKEN = credentials("${params.SAMSON_PAT}")
      }
      options {
        timeout(time: 300, unit: 'SECONDS')
        retry(5)
      }
      steps {
        samsonDeploy(ci_webhook: "969e5269659eecb1041010f28f28c131", token: SAMSON_TOKEN)
      }
    }
  }
}

