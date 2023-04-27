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
  }
}    
        
  
