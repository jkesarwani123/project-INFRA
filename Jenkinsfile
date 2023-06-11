pipeline {

    agent {
        node {
         label 'workspace'
        }
    }
    parameters {
        choice(name: 'env', choices: ['dev', 'prod'], description: 'env')
    }
    stages {
        stage('Terraform INIT') {
            steps{
                sh 'terraform init -backend-config=env-${env}/state.tfvars'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform -auto-approve -var-file=env-${env}/main.tfvars'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}