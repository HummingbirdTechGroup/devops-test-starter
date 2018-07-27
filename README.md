# Hummingbird DevOps Test Starter Application 

Utility to manage farms.

## Prerequisits

The main dependencies in order to run this code are [Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/).

## Running the application

You need to start by spinning up the docker containers. For this, just execute the following command:
```bash
docker-compose up -d
```
This command will build the server container (if it wasn't previously built) and start both servers, apache and mysql.

Apache server will take some time to finish booting because it has to install all the composer dependencies. You can
check how is progressing with this command:
```bash
docker logs -f devops-test-starter_website_1
```

When all the containers finish the load process, get the IP address of the appache server with this command:
```bash
docker inspect devops-test-starter_website_1 | grep IPAddress
```

Now you can go to `http://<ip-address>` in your browser to see the application on its glory.

## Viewing the farms

In order to view the farms, you just need to log into the webpage. You can use the following credentials:
- Username: devops
- Password: challenge

If you see the list of farms, congratulations! you have successfully started the service.

## Shutting down the services

The services will be automatically stopped when you turn your computer off. However, if you want to stop them before
it, you can execute the following command:
```bash
docker-compose down
```
