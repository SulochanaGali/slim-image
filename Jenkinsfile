pipeline {
  environment {
    imagename = "ngl7kor/jenkins_test/myapp1"
    registryCredential = 'mirantis-jenkins'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/SulochanaGali/slim-image.git'

      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    // stage('SonarQube Analysis') {
    //     environment {
                         
    //         PROJECT_NAME = "key-python-demoapp"    
    //     }
    //     steps {
    //         withSonarQubeEnv('sonarqube-test') {
    //             bat 'C:\\sonarqube-10.0.0.68432\\sonar-scanner-4.8.0.2856-windows\\bin\\sonar-scanner -Dsonar.projectKey=key-python-demoapp -Dsonar.sources=. -Dsonar.host.url=http://localhost:9009 -Dsonar.login=sqp_8d01c0fda0bd3f1ffe0588f3fa69125a9cf1485f'
    //         }
    //     }
    // }  
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry('https://bcr-de01.inside.bosch.cloud/', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')

          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
		bat "docker rmi $imagename:$BUILD_NUMBER"
        bat "docker rmi $imagename:latest"
      }
    }

    // docker.withRegistry('https://registry.example.com', 'credentials-id') {

    //     def customImage = docker.build("my-image:${env.BUILD_ID}")

    //     /* Push the container to the custom Registry */
    //     customImage.push()
    // }
  }
}