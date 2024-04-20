pipeline {
    agent {
        node('WORKER_1') // Specify the node name where you want to run the pipeline
    }
   stages 
   {
      stage('checkout')
       {
         steps
               {
                  checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Sakaleelasatish/my-java-project.git']])
               }
       }
    }
 }
