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