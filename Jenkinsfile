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
    }
}
