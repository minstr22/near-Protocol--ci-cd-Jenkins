pipeline {
    agent any
    stages {
        stage('build') {
            steps {
           sh '''
                curl --silent "https://api.github.com/repos/nearprotocol/nearcore/releases" | grep -Po '"tag_name": "${fs}K.*?(?=")' | grep beta | head -1
            '''
            }
             
            }
        }
    }
def fs = '/'


