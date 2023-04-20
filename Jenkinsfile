def img
pipeline {
    environment {
        registry = "kss7/python-jenkins" //To push an image to Docker Hub, you must first name your local image using your Docker Hub username and the repository name that you created through Docker Hub on the web.
        registryCredential = 'docker-hub-login'
        dockerImage = ''        
    }
    options {
        timeout(time: 30, unit: 'MINUTES')
        timestamps()
        checkoutToSubdirectory('slim-image')
        buildDiscarder(logRotator(numToKeepStr: '30'))
    }
    agent any
    stages {
        stage('checkout') {
            steps {
                git 'https://github.com/SulochanaGali/slim-image.git'
            }
        } 
        stage('Build Docker Image') {  
            steps{                     
	            sh 'docker build -t myapp:0.2 .'     
	            echo 'Build Image Completed'                
            }           
        } 
        stage('SonarCloud') {
            environment {
                SCANNER_HOME = tool 'SonarQubeScanner'                
                PROJECT_NAME = "key-python-demoapp"
    
            }
            steps {
                withSonarQubeEnv('SonarCloudOne') {
                    bat '''sonar-scanner.bat -D"sonar.projectKey=key-python-demoapp" -D"sonar.sources=." -D"sonar.host.url=http://localhost:9008" -D"sonar.token=sqp_8d01c0fda0bd3f1ffe0588f3fa69125a9cf1485f"'''
                }
            }
        }
        // stage('Push To DockerHub') {
        //     steps {
        //         script {
        //             docker.withRegistry( 'https://registry.hub.docker.com ', registryCredential ) {
        //                 dockerImage.push()
        //             }
        //         }
        //     }
        // }
    }     

}
