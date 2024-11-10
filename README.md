# kafka-zookeeper-compose

This repository provides a simple way to deploy Kafka and Zookeeper using Docker Compose. Follow the steps below to set up and deploy the containerized environment.

## Prerequisites

Ensure you have the following installed on your Linux system:
- Docker
- Docker Compose
- Java 8

## Setup Instructions

### Step 1: Launch the Deployment

Use Docker Compose to bring up the Kafka and Zookeeper containers:

```bash
$ docker-compose up -d
```

### Step 2: Verify the Deployment

To check if the containers are running, use the following command:
```bash
$ docker-compose ps
```

## Other Commands
### Start/Stop the Deployment
To start/stop the containers, use the following command:

```bash
$ docker-compose <start|stop>
```

### Stop and remove the Deployment
To stop and remove the containers, use the following command:

```bash
$ docker-compose down
```