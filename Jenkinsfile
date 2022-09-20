pipeline{
    agent{
        label 'MAD'
    }
    stages{
          stage('Checkout'){
            steps{
              checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], 
              userRemoteConfigs: [[url: 'https://github.com/eshwarprasadv5/hello-world.git']]])  
            }
          }
          stage('Build code'){
             steps{
                sh 'mvn clean install'
             }
          }
          stage('Build image'){
              steps{
                  sh 'docker build -t eshwarv5/tm-d .'
              }
          }
          stage('Docker login'){
              environment{
                  DOCKER_HUB_CREDENTIALS=credentials('docker_hub_credentials')
              }
              steps{
                  sh 'echo $DOCKER_HUB_CREDENTIALS_PSW | docker login -u $DOCKER_HUB_CREDENTIALS_USR --password-stdin'
              }
          }
          stage('Push image to docker hub'){
              steps{
                  sh 'docker push eshwarv5/tm-d'
              }
          }
          stage('Using Kubernetes deploy and run service'){
              steps{
                sh 'ansible-playbook /home/ansadmin/ansible-run.yml'
              }
          }
         
    }
    post{
        always{
         sh 'docker logout'
         sh 'docker rmi eshwarv5/tm-d'
        }
    }
    
}
