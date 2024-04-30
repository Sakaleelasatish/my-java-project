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
                }
            }
        }
    }
}
        }

        stage("build docker image") {
            steps {
                script {
                    // Build Docker image
                    docker.build("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}")
                }
            }
        }

        stage('Push Docker image') {
            steps {
                script {
                    // Login to Docker Hub
                    docker.withRegistry("${DOCKER_REGISTRY}", "${DOCKER_USERNAME}:${DOCKER_PASSWORD}") {
                        // Push Docker image to Docker Hub
                        docker.image("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}").push()
                    }
                }
            }
        }
    }
}
