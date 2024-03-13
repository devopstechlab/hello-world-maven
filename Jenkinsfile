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
                    docker build -t devopstechlab/samplewebapp:${BUILD_NUMBER} .
                    docker tag devopstechlab/samplewebapp:${BUILD_NUMBER} devopstechlab/samplewebapp:latest
                    docker push devopstechlab/samplewebapp:${BUILD_NUMBER}
                    docker push devopstechlab/samplewebapp:latest
                '''
            }
        }
    }
}
