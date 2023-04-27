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
          sh 'docker build -t my-app .'
      }
    }
     stage('push image') {
      steps {
          sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 833858706932.dkr.ecr.us-east-1.amazonaws.com"
          sh "docker push 833858706932.dkr.ecr.us-east-1.amazonaws.com/my-app:latest" 
      }    
    }
  }
}    
        
  
