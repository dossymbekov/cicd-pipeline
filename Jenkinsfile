pipeline {
  agent any
  
  environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
  }
  
  stages {
    stage('Build ') {
      steps {
        sh '''chmod +x scripts/build.sh
scripts/build.sh'''
      }
    }

    stage('Test') {
      steps {
        sh 'scripts/test.sh'
      }
    }

    stage('Build docker image') {
      steps {
        sh 'docker build -t jenkins_cicd_test_image .'
      }
    }

  }
}
