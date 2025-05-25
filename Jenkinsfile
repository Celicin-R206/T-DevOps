pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build --no-cache -t nextjs-app .'
            }
        }

        stage('Stop & Remove old container') {
            steps {
                sh 'docker stop nextjs-app || true'
                sh 'docker rm nextjs-app || true'
            }
        }

        stage('Run container') {
            steps {
                sh 'docker run -d -p 3001:3000 --name nextjs-app nextjs-app'
            }
        }
    }

    post {
        failure {
            echo 'Pipeline failed. Check logs for details.'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
    }
}