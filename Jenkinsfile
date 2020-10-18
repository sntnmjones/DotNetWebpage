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
        sh 'docker container rm $(docker container ls –aq)'
      }
    }
    stage('Docker Run') {
      agent any
      steps {
        sh 'docker run -p 8000:80 --name myapp aspnetapp'
      }
    }
  }
}