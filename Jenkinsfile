pipeline
{
    environment {
    registry = "sanskarhake/to-do-app"
    registryCredential = 'dockerhub'
    dockerImage = ''
    }

    agent any

    stages{
         stage ('Build and Deploy Docker Image') {
                 	steps {
                        script {
                            dockerImage = docker.build registry
                            docker.withRegistry( '', registryCredential ) {
                            dockerImage.push()
                        }
                 	}
                  }
         }
         stage('Deployment and Service') {
               steps{
                 sh "kubectl apply -f to-do-app-deployment.yaml"
                 sh "kubectl apply -f to-do-app-service.yaml"
               }
         }

    }
}
