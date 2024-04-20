pipeline {
    agent any
    environment {
        PATH = "$PATH:/opt/apache-maven-3.6.3/bin"
    }
    stages {
        stage('CHECKOUT') {
            steps {
                git 'https://github.com/Sakaleelasatish/my-java-project.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('Sonar-Server-7.6') {
                    sh "mvn sonar:sonar"
                }
            }
        }
    }
}

