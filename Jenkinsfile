pipeline {
  agent any
  stages {
    stage('Build ') {
      steps {
        sh 'sh scripts/build.sh'
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

    stage('Push image to dockerhub') {
      steps {
        sh '''echo $DOCKERHUB_CREDENTIALS | docker login --username almasdoss --password-stdin
docker push almasdoss/jenkins_cicd_test_image:latest
'''
      }
    }

  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
  }
}