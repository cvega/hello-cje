@Library('zendesk-jenkins') _

pipeline {
  agent any
  parameters {
    string(name: 'GCB_CREDENTIAL', defaultValue: 'docker-image-builder-179319')
    string(name: 'GCB_YAML', defaultValue: 'cloudbuild.yaml')
    string(name: 'SAMSON_PERSONAL_ACCESS_TOKEN', defaultValue: 'samson-pat-bcolfer')
    string(name: 'SAMSON_GENERAL_WEBHOOK_ID', defaultValue: '969e5269659eecb1041010f28f28c131')
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
        SAMSON_TOKEN = credentials("${params.SAMSON_PERSONAL_ACCESS_TOKEN}")
      }
      options {
        timeout(time: 300, unit: 'SECONDS')
        retry(5)
      }
      steps {
        samsonDeploy(webhook_id: SAMSON_GENERAL_WEBHOOK_ID, token: SAMSON_TOKEN)
      }
    }
  }
}

