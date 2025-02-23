pipeline {
    agent {label 'jenkins-jenkins-agent'}
    stages{
        stage ('Build'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker-hub-cred', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                    sh '''
                        docker login -u $DOCKER_USER -p $DOCKER_PASS
                        docker build . -t anas1243/simple-webapp-flask
                        docker push anas1243/simple-webapp-flask
                    '''
                }
            }
        }
    }
}