# DevOps Task Application

## Overview
This repository contains a **Node.js sample application** deployed using **CI/CD pipeline** with Jenkins, Docker, and AWS ECS. The pipeline demonstrates automation, scalability, and best DevOps practices.

---

## Architecture Diagram
![Architecture](./docs/architecture.png)

**Flow:**
1. Developer pushes code to GitHub (`dev` or `main` branch)
2. Jenkins triggers pipeline via webhook
3. Pipeline stages:
   - **Build**: Install dependencies & run tests
   - **Dockerize**: Build Docker image
   - **Push**: Push image to AWS ECR
   - **Deploy**: Update ECS service
4. Application is accessible via public URL

---

## Setup Instructions

### Prerequisites
- GitHub account
- AWS account
- Jenkins server with Docker & AWS CLI
- Node.js installed locally (optional for testing)

### Steps
1. **Clone the repository**
   ```bash
   git clone https://github.com/<your-username>/devops-task.git
   cd devops-task
2. Build & Run Locally
cd app
npm install
npm test
node index.js
Access app at: http://localhost:3000

Docker Build

docker build -t devops-task .
docker run -p 3000:3000 devops-task


Jenkins Pipeline

Configure pipeline with Jenkinsfile

Add GitHub webhook trigger

Add AWS credentials for ECR/ECS

Run pipeline to automatically deploy app

AWS ECS Deployment

Push Docker image to AWS ECR

Update ECS service with new image

App accessible via ECS public URL

Deployment Proof

Public URL: (Add ECS ALB URL or Cloud Run URL)

Screenshots: See deployment-proof/screenshots/

Tools & Services Used

CI/CD: Jenkins

Version Control: GitHub

Containerization: Docker

Cloud Deployment: AWS ECS, ECR

Monitoring/Logging: CloudWatch

Infrastructure (Optional): Terraform / CloudFormation

Challenges Faced

ECS service not updating initially due to incorrect service name.

Docker image layers caching causing push delays.

Correct AWS IAM role and permissions required for Jenkins.

Solutions:

Verified ECS service name before deployment

Used docker tag and force-push to ECR

Created dedicated IAM user with ECS/ECR permissions

Possible Improvements

Add Kubernetes deployment (EKS/GKE) for scalability

Add automated rollback on failed deployments

Integrate monitoring dashboard (CloudWatch/Stackdriver)


---

## **3️⃣ WRITEUP.md (Optional)**

```markdown
# DevOps Task Write-up

## Tools & Services Used
- GitHub (version control)
- Jenkins (CI/CD)
- Docker (containerization)
- AWS ECR & ECS (deployment)
- CloudWatch (monitoring)
- Node.js (sample application)

## Challenges Faced
- ECS deployment errors due to wrong service name
- AWS permissions required for Jenkins to push images
- Docker image push delay due to caching layers

## Solutions
- Verified ECS service name and task definition version
- Created dedicated IAM credentials for Jenkins
- Forced Docker push for layers

## Future Improvements
- Deploy on Kubernetes for high scalability
- Terraform-based infrastructure provisioning
- Add alerting for ECS task failures

4️⃣ Deployment Proof

Folder: deployment-proof/

Include:

Screenshots of Jenkins stages:

Build & Test

Docker build

Docker push

ECS deployment

Website running screenshot

public-url.txt with deployed app URL

5️⃣ Architecture Diagram

Create docs/architecture.png showing:

GitHub → Jenkins → Docker → AWS ECR → AWS ECS → Public URL


Optional: include CloudWatch monitoring flow