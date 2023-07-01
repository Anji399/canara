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
    stage("Build image") {
      steps {
          sh 'docker build -t canara .'
      }
    }
    stage('push image') {
      steps {
          sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 378032438507.dkr.ecr.us-east-1.amazonaws.com"
          sh "docker tag canara:latest 378032438507.dkr.ecr.us-east-1.amazonaws.com/canara:latest"
          sh "docker push 378032438507.dkr.ecr.us-east-1.amazonaws.com/canara:latest"
      }    
    }
    stage('k8s deploy') {
      steps {
          withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'k8s', namespace: '', serverUrl: '') {
          sh 'kubectl apply -f deploy.yml'
          }
      }
    }     
  }
}    
        
  
