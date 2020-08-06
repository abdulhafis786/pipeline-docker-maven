pipeline {
    agent any
    
    environment { 
          PASS = credentials('Dockerhub_pass')  #### Here we add a secret text in Jenkins to store our docker hub password which is passed here as credentials
    }
    stages {
        stage('Build') {
            steps {
                 sh '''
                     ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
                     ./jenkins/build/build.sh
                   
                   '''
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/test/mvn-test.sh mvn test'
            }
        }
        stage('Push') {
            steps {
                sh './jenkis/push/push.sh' 
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo deploy'            }
        }
    }
}
