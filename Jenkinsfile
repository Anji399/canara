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
          sh 'docker build -t 833858706932.dkr.ecr.ap-south-1.amazonaws.com/atm .'
      }
    }   
  }
}    
        
  
