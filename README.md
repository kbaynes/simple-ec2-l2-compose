# Simple EC2 Linux 2 Docker Compose Application

## Goal

Demonstrate the use of a startup script, docker compose and a systemd unit to create an application that runs as a service on an Amazon EC2 LInux 2 AMI distribution.

The application used is a [Spring Boot Hello World](https://github.com/kbaynes/docker-springboot-helloworld) runnable JAR, which has no depedencies, and which is linked in via the [kbaynes/springboot-helloworld:latest](https://hub.docker.com/r/kbaynes/springboot-helloworld) Docker image.

## EC2

To use this setup script on Amazon EC2:
- Click Launch Instance and select the Amazon Linux 2 AMI instance (tested with 64-bit x86)
- Select a type (tested with t2.micro: Variable ECUs, 1 vCPUs, 2.5 GHz, Intel Xeon Family, 1 GiB memory, EBS only), click Next
- Expand the Advanced section at the bottom, copy the contents of setup.sh into the User Data input field or select 'as file' and select the setup.sh file, then keep clicking Next
- On Configure Security Group: Do not use 'Default Security Group' because it does not have any open ports. Create a Security Group in EC2 and open ports 80 and 22. The wizard on this page makes it easy if you do not already have a Security Group for these types of instances. I use MyDefaultDMZ security group.
- Click Review and Launch, then Launch. It's easiest if you have a default SSH key pair configured.

Initial setup until the app was running was less than 2 minutes.

Confirm that the instance is running by connecting to the IP of the instance in a browser. You should see the 'Hello World!' screen.

Confirm that the app is running as a service by stopping the instance, confirming that the webapp no longer responds, then re-start the instance and confirm that the webapp responds again.

By my tests, the server rebooted and the app was running again in about 30 seconds.