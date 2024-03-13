pipeline {
    agent any
    stages {
        stage('git-download') {
            steps {
                git 'https://github.com/devopstechlab/hello-world-maven.git'
            }
        }
        stage('Docker Build-Tag-Push') {
            steps {
                sh '''
                    docker build -t samplewebapp:${BUILD_NUMBER} .
                    docker tag samplewebapp:${BUILD_NUMBER} samplewebapp:latest
                    docker push samplewebapp:${BUILD_NUMBER}
                    docker push samplewebapp:latest
                '''
            }
        }
    }
}
