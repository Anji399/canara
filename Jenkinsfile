pipeline {
    agent any
    environment {
        registry = 'mvpar/canara'
        registryCredential = 'dockerhub_id'
        dockerImage = ''
    }  
    stages {
        stage('git clone'){
            steps {
              checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Anji399/canara.git']])
            }
        }
        stage('docker build'){
            steps {
              script {
                  dockerImage = docker.build registry + ":$BUILD_NUMBER"
              }
            }
        }
        stage('push image'){
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
