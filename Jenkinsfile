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
    stage('Docker Run') {
      agent any
      steps {
        sh 'docker run -p 8000:80 --name myapp aspnetapp'
      }
    }
  }
}