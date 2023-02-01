pipeline {
  agent any
  stages
    {
    stage('Git checkout') {
      steps {
        git changelog: false, poll: false, url: 'https://github.com/Anji399/canara.git' 
      }
    }
    stage('Package') {
      steps {
        sh 'mvn package'
      }
    }
    stage('Build docker image') {
      steps {
        sh 'docker build -t mvpar/canara:1.0.1 .'  
      }    
    }
    stage('Push docker image') {
      steps {
       withCredentials([string(credentialsId: 'dockerize', variable: 'dockerr')]) {
        sh "docker login -u mvpar -p ${dockerr}"
       }  
        sh 'docker push mvpar/canara:1.0.1'
      }    
    }
    stage('Deploy docker-app on host') {
      steps {
        sshagent(['sec']) {
         sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.3.95'
         sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.3.95 docker run -d -p 8081:8080 --name mprppm mvpar/canara:1.0.1'
        }
      }    
    }
  }
}  
