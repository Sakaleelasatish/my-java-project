pipeline
 {
    agent any

    stages
    {
        stage('checkout')
        {
            steps
            {
             checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Sakaleelasatish/my-java-project.git']])   
            }
        }
        stage('build')
        {
            steps 
            {
             sh 'mvn clean package'   
            }
        }
    }
 } 
