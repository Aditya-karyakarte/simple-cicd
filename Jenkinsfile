pipeline {
    agent any
    stages {
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
    }
}
