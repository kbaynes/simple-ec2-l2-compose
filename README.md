# Simple EC2 Linux 2 Docker Compose Application

## Goal

Demonstrate the use of a startup script, docker compose and a systemd unit to create an application that runs as a service on an Amazon EC2 LInux 2 AMI distribution.

The application used is a [Spring Boot Hello World](https://github.com/kbaynes/docker-springboot-helloworld) runnable JAR, which has no depedencies, and which is linked in via the [kbaynes/springboot-helloworld:latest](https://hub.docker.com/r/kbaynes/springboot-helloworld) Docker image.

## EC2

To use this setup script on Amazon EC2:
- Click Launch Instance and select the Linux 2 AMI instance (tested with 64-bit x86)
- Select a type (tested with t2.micro: Variable ECUs, 1 vCPUs, 2.5 GHz, Intel Xeon Family, 1 GiB memory, EBS only)
- Click Next: Configure Instance Details, expand the Advanced section at the bottom
- Enter the following Launch Script into the User Data input field
- Click Review and Launch, then Launch

```
curl -o ./setup.sh https://raw.githubusercontent.com/kbaynes/docker-compose-ec2-l2/master/setup.sh
chmod +x ./setup.sh
./setup.sh
```

Confirm that the instance is running by connecting to the IP of the instance in a browser. You should see the 'Hello World!' screen.

Confirm that the app is running as a service by stopping the instance, confirming that the webapp no longer responds, then re-start the instance and confirm that the webapp responds again.