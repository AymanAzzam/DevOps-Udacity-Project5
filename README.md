# Todo App

## PreRequisites 
1. Docker.

2. npm.

3. yarn.

4. Cypress dependencies.

5. Jenkins.

6. Opening port 1024 for app deployment and port 8080 for jenkins.

## Run
Note: you need to change the DNS_Name inside Dockerfile first. <br />

From this directory run the following Scripts:
1. Run the script prerequisites.sh to install PreRequisites for ubuntu
```sh
$ sudo ./scripts/prerequisites.sh
```

2. Run the following commands to move all files in same directory
```sh
$ cp scripts/* Dockerfile todo-app/
$ cd todo-app
$ chmod 777 run_app.sh
$ chmod 777 run_docker.sh
```

3. Run this bash script with the DNS name for the instance to run without Docker (for Local machine write 127.0.0.1)
```sh
$ sudo ./run_app.sh ec2-3-226-249-235.compute-1.amazonaws.com
```

4. Run this bash script with the DNS name for the instance to run with Docker (for Local machine write 127.0.0.1)
```sh
$ sudo ./run_docker.sh ec2-3-226-249-235.compute-1.amazonaws.com
```

5. Open DNS_Name:1024 in browser to access the todo-app.

## Jenkins
1. Configure Jenkins and install BlueOcean, Xvfb and NodeJS plugins then Create pipeline using BlueOcean.

2. Add the user to the docker group using the next command:
```sh
$ sudo usermod -a -G docker jenkins
```

3. Restart Jenkins using the following command:
```sh
$ sudo /etc/init.d/jenkins restart
```

## Problems
1. I can't archiveartifacts artifacts prefixes.

2. End-to-end testing fails in Jenkins with error: spawn Xvfb ENOENT jenkins.