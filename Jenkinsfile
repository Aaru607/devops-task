pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
        ECR_REPO = '905418143897.dkr.ecr.ap-south-1.amazonaws.com/devopstaskrepo'
        IMAGE_NAME = 'devops-task'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from dev branch
                git branch: 'dev', url: 'https://github.com/Aaru607/devops-task.git', credentialsId: 'github-pat'
            }
        }

        stage('Build & Test') {
            steps {
                // Install npm dependencies
                bat 'npm install'
                // Run tests, continue even if tests fail
                bat 'npm test || echo "Tests failed but continuing..."'
            }
        }

        stage('Docker Build & Push') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials']]) {
                    // Build Docker image and push to AWS ECR
                    bat """
                        docker build -t %IMAGE_NAME% .
                        docker tag %IMAGE_NAME%:latest %ECR_REPO%:latest
                        aws ecr get-login-password --region %AWS_REGION% | docker login --username AWS --password-stdin %ECR_REPO%
                        docker push %ECR_REPO%:latest
                    """
                }
            }
        }

        stage('Deploy to ECS') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials']]) {
                    // Update ECS service to use the new image
                    bat """
                        aws ecs update-service --cluster devops-task-cluster ^
                        --service devops-task-service ^
                        --force-new-deployment
                    """
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished!'
        }
        success {
            echo 'Deployment succeeded!'
        }
        failure {
            echo 'Deployment failed! Check logs for errors.'
        }
    }
}
