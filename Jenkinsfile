pipeline {
  agent any
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
        sh 'docker build -t almasdoss/jenkins_cicd_test_image:latest .'
      }
    }

    stage('Push image to dockerhub') {
      steps {
         script {
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                sh 'docker push almasdoss/jenkins_cicd_test_image:latest'
          }
        }
      }
    }

  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
  }
}
