pipeline {
    agent any

    environment {
        // Repo is bind-mounted into the Jenkins container at /repos/iot-gateway
        REPO_URL = 'file:///repos/iot-gateway'
    }

    stages {
        stage('Git Pull') {
            steps {
                git branch: 'main', url: "${REPO_URL}"
            }
        }

        stage('IoT Verification') {
            steps {
                sh 'grep 1883 mqtt.conf'
            }
        }

        stage('Image Packaging') {
            steps {
                sh 'docker build -t iot-hub:latest .'
            }
        }
    }

    post {
        success { echo 'IoT Gateway pipeline succeeded: iot-hub:latest built' }
        failure { echo 'IoT Gateway pipeline failed' }
    }
}
