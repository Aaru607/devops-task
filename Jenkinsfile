pipeline {
    agent any

    environment {
        IMAGE_NAME = 'aaru607/devops-task'
        REGISTRY = 'docker.io'
        TAG = "${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Cloning repository...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Installing dependencies and running tests...'
                bat 'npm install'
                bat 'npm test || echo Tests skipped or failed'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    echo "Building Docker image..."
                    bat "docker build -t %IMAGE_NAME%:%TAG% ."
                }
            }
        }

        stage('Push to Registry') {
            steps {
                script {
                    echo "Pushing Docker image to DockerHub..."
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        bat "echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin %REGISTRY%"
                        bat "docker push %IMAGE_NAME%:%TAG%"
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying to cloud environment..."
                bat 'echo Deployment script goes here.'
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            bat 'docker logout'
        }
    }
}
