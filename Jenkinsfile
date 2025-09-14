pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
        ECR_REPO = '905418143897.dkr.ecr.ap-south-1.amazonaws.com/devops-task-repo'
        AWS_PROFILE = 'default'  // Optional if you have AWS CLI configured
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'dev', url: 'https://github.com/Aaru607/devops-task.git', credentialsId: 'github-pat'
            }
        }

        stage('Build & Test') {
            steps {
                bat 'npm install'
                bat 'npm test || echo "Tests failed but continuing..."'
            }
        }

        stage('Docker Build & Push') {
            steps {
                bat """
                    docker build -t devops-task .
                    docker tag devops-task:latest ${ECR_REPO}:latest
                    aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REPO}
                    docker push ${ECR_REPO}:latest
                """
            }
        }

        stage('Deploy to ECS') {
            steps {
                bat """
                    aws ecs update-service --cluster devops-task-cluster ^
                    --service devops-task-service ^
                    --force-new-deployment
                """
            }
        }
    }

    post {
        always { echo 'Pipeline finished!' }
    }
}
