pipeline {
    agent {
        docker {
            image 'maven:3.8.1-adoptopenjdk-11'
            args '-v /root/.m2:/root/.m2'
        }
    }
    environment{
        registry = 'dockerReg'
        registryCredential = 'dockerCred'
        dockerImage = ''
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building....'
                sh 'mvn --version'
                sh 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing....'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Building image') {
            steps{
                echo 'Building docker image....'
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Deploy Docker Image') {
            steps {
                echo 'Deploying....'
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}