def img
pipeline {
    environment {
        registry = "kss7/python-jenkins" //To push an image to Docker Hub, you must first name your local image using your Docker Hub username and the repository name that you created through Docker Hub on the web.
        registryCredential = 'docker-hub-login'
        dockerImage = ''
    }
    agent any
    stages {
        stage('checkout') {
            steps {
                git 'https://github.com/kss7/SimpleFlaskUI.git'
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
