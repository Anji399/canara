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
          sh "docker tag canara:latest 833858706932.dkr.ecr.us-east-1.amazonaws.com/canara:latest"
          sh "docker push 833858706932.dkr.ecr.us-east-1.amazonaws.com/canara:latest"
      }    
    }   
  }
}    
        
  
