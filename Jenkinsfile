@Library('zendesk-jenkins') _

pipeline {
  agent any
  parameters {
    string(name: 'GCB_CREDENTIAL', defaultValue: 'docker-image-builder-179319')
    string(name: 'GCB_YAML', defaultValue: 'cloudbuild.yaml')
    string(name: 'SAMSON_HOST', defaultValue: 'samson.zd-mini.com')
    string(name: 'SAMSON_GENERAL_WEBHOOK_ID', defaultValue: '969e5269659eecb1041010f28f28c131')
    string(name: 'SAMSON_PERSONAL_ACCESS_TOKEN', defaultValue: 'samson-pat-bcolfer')
  }
  stages {
    stage('build') {
      environment {
        GCB_CREDENTIAL = "${params.GCB_CREDENTIAL}"
        GCB_YAML = "${params.GCB_YAML}"
      }
      failFast true
      parallel {
        stage('Google Cloud Build') {
          steps {
            googleCloudBuilder(credentialsId: GCB_CREDENTIAL, cloudBuildFile: GCB_YAML)
          }
        }
        stage('Travis CI') {
          steps {
            echo "Travis would run here"
          }
        }      
      }
    }
    stage('Deploy to stage with Samson') {
      environment {
        GITHUB_REPO = sh(returnStdout: true, script: "basename ${GIT_URL} .git").trim()
        SAMSON_HOST = "${params.SAMSON_HOST}"
        SAMSON_TOKEN = credentials("${params.SAMSON_PERSONAL_ACCESS_TOKEN}")
        SAMSON_WEBHOOK = "${params.SAMSON_GENERAL_WEBHOOK_ID}"
      }
      options {
        timeout(time: 300, unit: 'SECONDS')
      }
      steps {
        samsonDeploy(host: SAMSON_HOST, token: SAMSON_TOKEN, webhook: SAMSON_WEBHOOK, repo: GITHUB_REPO)
      }
    }
  }
  post { 
    always { 
      slackSend (color: '#FFFF00', message: "Pipeline '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
    }
  }
}
