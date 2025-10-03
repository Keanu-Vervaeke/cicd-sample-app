node {
    stage('Preparation') {
        catchError(buildResult: 'SUCCESS') {
            echo 'Cleaning up any old containers...'
            sh 'docker stop todoapp-running || true'
            sh 'docker rm todoapp-running || true'
        }
    }
    stage('Pull Docker Image') {
        echo 'Pulling the Docker image...'
        sh 'docker pull docker/getting-started:latest'
    }
    stage('Run') {
        echo 'Running the Docker container...'
        sh 'docker run -d -p 3000:3000 --name todoapp-running docker/getting-started:latest'
    }
}