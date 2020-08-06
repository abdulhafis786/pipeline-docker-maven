pipeline {
    agent any
    
    environment { 
          PASS = credentials('Dockerhub_pass')
    }
    stages {
        stage('Build') {
            steps {
                 sh '''
                     ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
                     ./jenkins/build/build.sh
                   
                   '''
            }

           post {
              success {
                 archiveArtifacts artifacts: 'java-app/target/*.jar', fingerprint: true
                 }
             }   
          }  
        stage('Test') {
            steps {
                sh './jenkins/test/mvn-test.sh mvn test'
            } 
            
           post {
             always {
                junit 'java-app/target/surfire-reports/*.xml'
             }
        }
        stage('Push') {
            steps {
                sh './jenkis/push/push.sh' 
            }
        }
    }
  }
}

