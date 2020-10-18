#!groovy

pipeline {
  agent none
  stages {
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t aspnetapp .'
      }
    }
    stage('Remove existing containers') {
      agent any
      steps {
        sh 'docker stop $(docker ps -a -q)'
        sh 'docker rm $(docker ps -a -q)'
      }
    }
    stage('Docker Run') {
      agent any
      steps {
        sh 'docker run -d -p 8000:80 --name myapp aspnetapp'
      }
    }
  }
}