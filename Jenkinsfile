#!groovy

pipeline {
  agent none
  stages {
    stage('Build') {
      agent any
      steps {
        sh 'docker build -t aspnetapp .'
      }
    }
    stage('Run') {
      agent any
      steps {
        sh 'docker run -d -p 80:80 --name myapp aspnetapp'
        sh "docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $INSTANCE_ID"
      }
    }
  }
}