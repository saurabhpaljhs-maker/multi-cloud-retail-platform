pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "sauraabh/retail-app"   // ← Updated with your username
        DOCKER_TAG   = "${BUILD_NUMBER}"
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ./app"
                sh "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_IMAGE}:latest"
            }
        }
        
        stage('Security Scan (Trivy)') {
            steps {
                sh "docker run --rm aquasec/trivy image ${DOCKER_IMAGE}:${DOCKER_TAG} --severity CRITICAL,HIGH --exit-code 1"
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub-credentials', url: '']) {
                    sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                    sh "docker push ${DOCKER_IMAGE}:latest"
                }
            }
        }

        stage('Deploy to Azure AKS') {
            steps {
                withCredentials([azureServicePrincipal('azure-credentials')]) {
                    sh '''
                        az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET --tenant $AZURE_TENANT_ID
                        az aks get-credentials --resource-group dev-retail-rg --name dev-retail-aks --overwrite-existing
                        kubectl apply -f kubernetes/
                        kubectl set image deployment/retail-app retail=${DOCKER_IMAGE}:${DOCKER_TAG} || true
                    '''
                }
            }
        }
    }
    
    post {
        success {
            echo "✅ Multi-Cloud Retail Platform Deployed Successfully on Azure!"
        }
        failure {
            echo "❌ Pipeline Failed!"
        }
    }
}
