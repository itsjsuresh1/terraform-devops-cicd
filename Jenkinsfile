pipeline {
    agent any
    tools {
        maven 'maven-3.6.3' 
    }
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
    }
    stages {
        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    docker.build("jboothapati/demo_app:${TAG}")
                }
            }
        }
	    stage('Pushing Docker Image to Dockerhub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker_credential') {
                        docker.image("jboothapati/demo_app:${TAG}").push()
                        docker.image("jboothapati/demo_app:${TAG}").push("latest")
                    }
                }
            }
        }
        stage('Deploy to kubernetes'){
            steps {
                sh kubectl run nginx --image=jboothapati/demo_app:${TAG} --replicas=5 --port=8090"
            }
        }
    }
}