pipeline {
    agent any

    stages {
        stage('Cloner le projet') {
            steps {
                git branch: 'main', url: 'https://github.com/Celicin-R206/T-DevOps.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t nextjs-app .'
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
                sh 'docker run -d -p 3000:3000 --name nextjs-app nextjs-app'
            }
        }
    }
}
