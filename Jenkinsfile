pipeline {
    
    agent any

    // triggers {
    //     cron('H/15 * * * *')
    // }

    stages {

        stage("Check Active instances") {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'AWS Credentials'
                ]]) {
                    script {
                    sh 'aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text > active_instances.txt'
                    sh "cat active_instances.txt"
                    }
                }
            }
        }
    }    
// 1. Which instances are active and Launch time is > 15 MINUTES
// TF init
// 2. Get TF Worksapce info
// 3. TF DEstroy workspace
// 4. (TF workspace select default) delete workspace

//         stage("Terraform Init") {
//             step
//         }
}
