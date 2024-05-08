pipeline {
    agent any
    stages {
        stage('clean workspace') {
            steps {
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
                sh 'mvn clean package'
            }
        }

        stage("build docker image") {
            steps {
                script {
                    // Build Docker image
                     docker.build('my-java-project-image')
                     docker push sakaleelasatish/my_java_project:tagname
                }
            }
        }
   
       stage('Push Docker image') {
            steps {
                script {
                    // Push Docker image to Docker Hub
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials-id') {
                        docker.image('my-java-project-image').push('mjp-1.0.0')
                    }
                }
            }
         }
}
