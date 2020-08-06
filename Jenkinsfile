pipeline {
    agent any
    stages {
        stage('build') {
            steps {
           sh '''
          for tag in $TAGS;
          do
            # if $github_tag contains in $tag
            if [[ stop == start ]]; then
              echo "Tag:$tag already deployed"
              exit 1
            elif [ -z "$tag" ]; then
              echo testing
            fi
          done
            '''
            }
             
            }
        }
    }
def fs = '/'


