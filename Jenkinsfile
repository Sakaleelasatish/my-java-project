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
         /*stage("Sonarqube Analysis "){
            steps{
                withSonarQubeEnv('sonar-server') {
                    sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=my_java_Project \
                    -Dsonar.projectKey=my_java_project '''
                }
            }
        }
        stage("quality gate"){
           steps {
                script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'Sonar-token' 
                }
            } 
        }*/
    }
}

