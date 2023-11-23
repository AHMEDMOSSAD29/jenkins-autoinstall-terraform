pipeline {
    agent any

    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}
    stages {
        stage('Docker Login') {
            steps {
                // Add --password-stdin to run docker login command non-interactively
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Build & push Dockerfile') {
            steps {
                sh """
                docker build -t app .
		docker tag app ahmedmosaad112/app:v1
  		docker push ahmedmosaad112/app:v1
    		docker run -d --name application -p 8080:3000 ahmedmosaad112/app:v1
                """
            }
        }
    } 
}
