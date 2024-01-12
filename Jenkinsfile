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
        sh 'docker build -t almasdoss/jenkins_cicd_test_image:$BUILD_NUMBER .'
      }
    }

    stage('Push image to dockerhub') {
      steps {
         script {
            sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin docker.io'
            sh 'docker push almasdoss/jenkins_cicd_test_image:$BUILD_NUMBER'
        }
      }
    }

  }
}
