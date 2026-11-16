pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                sh 'grep -q "Hello" index.html'
            }
        }
        stage('Build Image') {
            steps {
                sh 'docker build -t simple-cicd:${BUILD_NUMBER} .'
            }
        }
        stage('Deploy to Staging') {
            steps {
                sh 'ansible-playbook deploy.yml -e version=${BUILD_NUMBER} -e health_host=172.17.0.1'
            }
        }
        stage('Approval') {
            steps {
                input message: 'Deploy to production-like?'
            }
        }
        stage('Deploy to Production-like') {
            steps {
                sh 'ansible-playbook deploy.yml -e version=${BUILD_NUMBER} -e health_host=172.17.0.1 -e container=simple-cicd-prod -e port=8083'
            }
        }
    }
}
