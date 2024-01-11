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
        sh 'docker build -t almasdoss/jenkins_cicd_test_image .'
      }
    }

    stage('Push image to dockerhub') {
      steps {
         script {
          // docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
          //       sh 'docker push almasdoss/jenkins_cicd_test_image'
          
                def nodeAppDockerfilePath = 'src/Dockerfile'
                // Build the Node.js app Docker image
                sh "docker build -t almasdoss/jenkins_cicd_test_image:$BUILD_NUMBER -f ${nodeAppDockerfilePath} ."
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin docker.io'                 
                sh 'docker push almasdoss/jenkins_cicd_test_image:$BUILD_NUMBER'                 
                sh 'docker logout'
                // Run the Node.js app Docker container (modify the port as needed)
                // sh "docker run -d -p 3000:3000 --name nodeapp-container almasdoss/nodeapp:$BUILD_NUMBER"
      
          // }
        }
      }
    }

  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
  }
}
