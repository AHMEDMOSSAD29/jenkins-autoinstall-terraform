pipeline {
     agent any
}
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    
    stages {
        stage('Docker Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        
        stage('Build & push Dockerfile') {
            steps {
                script {
                    def containerExists = sh(script: 'docker inspect -f \'{{.State.Running}}\' application', returnStatus: true)
                    
                    if (containerExists == 0) {
                        sh 'docker stop application'
                        sh 'docker rm application'
                    }
                    
                    sh '''
                    // docker build -t app .
                    // docker tag app ahmedmosaad112/app:v2
                    // docker push ahmedmosaad112/app:v2
                    docker run -d --name application -p 3000:3000 ahmedmosaad112/app:v2
                    '''
                }
            }
        }
    }
     post {
    success {
      slackSend(color: "good", message: "Build completed successfully!")
    }
    failure {
      slackSend(color: "danger", message: "Build failed!")
    }
  }
}
