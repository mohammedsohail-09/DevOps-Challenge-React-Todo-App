# 🚀 DevOps Engineer Challenge Project

This repository demonstrates a full-stack DevOps pipeline to deploy a React application using Docker, Jenkins, and AWS infrastructure components. It includes setting up a CI/CD pipeline, building Docker images, using GitHub PAT, uploading to S3, and deploying with Docker Compose.

---

## 📁 Project Structure

.
├── Dockerfile # Docker build file for React app
├── docker-compose.yml # Compose file to run the app
├── java_setup.sh # Script to install Java (for Jenkins or apps)
├── index.html # Static build output
├── static/ # React static assets
├── asset-manifest.json
├── favicon.ico
└── README.md


---

## 🔧 Prerequisites

- AWS EC2 instance (Ubuntu)
- Docker & Docker Compose installed
- Node.js + npm (for local testing)
- Jenkins (installed and configured)
- AWS CLI configured for S3
- Docker Hub account
- GitHub Personal Access Token (PAT) if repo is private

---

## 📦 Clone Repository

### Public Repo
```bash
git clone https://github.com/mohammedsohail-09.git

🛠 Setup and Run
1. Build and Start the React App with Docker Compose

docker compose up --build -d

React app will be served via serve on port 4000.

To stop the app:
docker compose down

🐳 Docker Hub Integration
Tag and Push
docker tag react_react-app:latest mohammedsohail1047/react-app:latest
docker login
docker push mohammedsohail1047/react-app:latest

🧪 Java Setup Script (Optional)
Use this script to install Java for Jenkins agents or any Java-based app:

chmod +x java_setup.sh
./java_setup.sh

🧰 Jenkins CI/CD Pipeline (Example)
Steps:
Pull code from GitHub using PAT.

Build React app.

Archive the build artifacts.

Upload to S3 bucket.

Trigger Docker build & deployment.

Jenkinsfile Example

pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git credentialsId: 'github-pat', url: 'https://github.com/<username>/<repo>.git'
            }
        }

        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }

        stage('S3 Upload') {
            steps {
                sh 'aws s3 cp build/ s3://<bucket-name>/ --recursive'
            }
        }

        stage('Docker Build & Push') {
            steps {
                sh 'docker build -t mohammedsohail1047/react-app:latest .'
                sh 'docker push mohammedsohail1047/react-app:latest'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker compose up -d'
            }
        }
    }
}

🌐 Access the App
After deployment, access your app at:
http://<your-ec2-public-ip>:4000

🔒 Security Notes
Do not hardcode GitHub tokens or AWS keys in code.

Use Jenkins credentials or environment secrets.

Lock down ports using ufw or AWS Security Groups.

👨‍💻 Author
Mohammed Sohail

Built for DevOps Engineering Challenge – 2025
Stack: Docker, Jenkins, React, AWS, GitHub PAT

