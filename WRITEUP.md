# DevOps Task - CI/CD Pipeline Project

## Tools & Services Used

- **GitHub** – Version control and source code management with branching strategy (`main` & `dev`).
- **Jenkins** – CI/CD automation, pipeline orchestration, and GitHub webhook integration.
- **Node.js** – Sample application for demonstrating build, test, and deployment.
- **Docker** – Containerization of the Node.js application.
- **AWS ECR** – Docker image registry for storing container images.
- **AWS ECS (Fargate)** – Deployment of containerized application in a scalable and managed environment.
- **AWS CloudWatch** – Basic monitoring and logging of ECS service and tasks.
- **Terraform (optional)** – Infrastructure as Code to provision ECS cluster, task definition, and service.

---

## Challenges Faced & Solutions

1. **GitHub Webhook Integration**
   - *Challenge:* Initial Jenkins pipeline did not trigger automatically on push.
   - *Solution:* Configured GitHub webhook to trigger Jenkins pipeline on `dev` branch pushes.

2. **Docker Image Push**
   - *Challenge:* Docker push to AWS ECR failed due to authentication.
   - *Solution:* Used `aws ecr get-login-password` with `docker login` in Jenkins pipeline with credentials.

3. **ECS Deployment**
   - *Challenge:* Service update failed due to incorrect service name and cluster reference.
   - *Solution:* Verified ECS service name and cluster ARN and updated `aws ecs update-service` command.

4. **Serving Static Image**
   - *Challenge:* Application initially only returned text, not the image.
   - *Solution:* Updated Express.js server to use `res.sendFile()` to serve the PNG image from project directory.

5. **Public Access**
   - *Challenge:* Making application publicly accessible.
   - *Solution:* Configured AWS security group to allow port 3000 and exposed the service through ECS Fargate.

---

## Possible Improvements

- **High Availability & Load Balancing:** Deploy multiple ECS tasks with an Application Load Balancer (ALB) to handle traffic efficiently.
- **CI/CD Enhancement:** Add automated rollback if deployment fails and include more stages such as linting and code quality checks.
- **Monitoring:** Integrate detailed CloudWatch dashboards for CPU, memory, and request metrics, along with SNS alerts.
- **Infrastructure Automation:** Fully automate infrastructure provisioning with Terraform or CloudFormation including networking, VPC, and IAM roles.
- **Testing:** Add proper unit and integration tests instead of simple echo commands.
- **Multi-Environment Deployment:** Implement separate dev, staging, and production environments with branch-based deployments.

---

**Project Status:** Fully functional CI/CD pipeline deploying a containerized Node.js application to AWS ECS, with Docker image stored in ECR, automated build and deployment through Jenkins, and public accessibility for verification.
