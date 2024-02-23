pipeline {
    agent any
    tools {
        maven 'maven3.9'
        jdk 'java17'
    }
    stages {
        stage('git-download') {
            steps {
                git 'https://github.com/devopstechlab/hello-world-maven.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Archive-Artifacts') {
            steps {
                archiveArtifacts artifacts: '**/*.war', followSymlinks: false
            }
        }
        stage('Junit-report') {
            steps {
                junit stdioRetention: '', testResults: '**/target/surefire-reports/*.xml'
            }
        }
        stage('Trigger-Deploy-Job') {
            steps {
                build 'deploy-to-dev'
            }
        }
    }
}
