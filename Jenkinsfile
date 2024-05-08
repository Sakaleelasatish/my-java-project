pipeline {
    agent any
    environment {
        PATH="$PATH:/opt/apache-maven-3.6.3/bin"
    }
    stages {
        stage('checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Sakaleelasatish/my-java-project.git']])
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean deploy'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool 'sonar-scanner-5.0.1'; // assuming you have configured SonarQube Scanner tool in Jenkins
                    withSonarQubeEnv('Sonar-Server-7.6')  {
                        sh "${scannerHome}/bin/sonar-scanner"
                    }
                }
            }
        }
    }
