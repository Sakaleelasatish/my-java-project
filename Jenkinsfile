pipeline {
    agent any
    environment {
        SCANNER_HOME=tool 'sonar-scanner'
    }
    stages {
        stage('clean workspace'){
            steps{
                cleanWs()
            }
        }

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
        /*stage('unit test') {
            steps {
                // Run JUnit tests
                sh 'mvn test'
            }
            post {
                always {
                    junit '**/target/surefire-reports/*.xml'
                }
            }
        }*/
        stage("build docker image") {
            steps {
                script {
                    // Build Docker image
                    docker.build('my-java-project-image')
                }
            }
        }
    }
}
