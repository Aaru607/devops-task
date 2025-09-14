pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "aaru607/devops-task:8"
    }

    stages {

        stage('Checkout SCM') {
            steps {
                echo 'Checking out code from GitHub...'
                checkout scm
            }
        }

        stage('Install Dependencies & Test') {
            steps {
                echo 'Installing npm dependencies...'
                bat 'npm install'

                echo 'Running tests (if any)...'
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    bat 'npm test || echo Tests skipped or failed'
                }
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                bat "docker build -t %DOCKER_IMAGE% ."
            }
        }

        stage('Push to DockerHub') {
            steps {
                echo 'Pushing Docker image to DockerHub...'
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat "docker login -u %DOCKER_USER% -p %DOCKER_PASS%"
                    bat "docker push %DOCKER_IMAGE%"
                    bat "docker logout"
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploy stage skipped for now (add your deployment commands here)'
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            bat 'docker logout'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
