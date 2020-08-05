pipeline {
    agent any
    stages {
        stage('build') {
            sh script: $/
    curl --silent "https://api.github.com/repos/nearprotocol/nearcore/releases" | grep -Po '"tag_name": "\K.*?(?=")' | grep beta | head -1 \;
    /$
            
        
             
            }
        }
    }
}
