pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Sakaleelasatish/my-java-project.git']])   
            }
        }
        stage('build') {
            steps {
                // You can replace 'mvn clean package' with your actual Maven build command
                sh 'mvn clean deploy'
            }
        }
    }
}

