#!groovy

pipeline {
  agent none
  stages {
    stage('Remove existing containers') {
      agent any
      steps {
        sh 'if [ "$(docker ps -a -q)" ]; then docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q); fi'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t aspnetapp .'
      }
    }
    stage('Docker Run') {
      agent {
        docker {
        image 'aspnetapp'
        args '-p 80:80'
        }
      }
      steps {
        sh 'docker run -d -p 80:80 --name myapp aspnetapp'
      }
    }
  }
}