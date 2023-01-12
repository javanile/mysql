# MySQL 

> The best MySQL container for your docker compose file.

## Introduction and benefits

The MySQL image is a tool designed to make it easy for users to run and customize MySQL database. 
Our mission is to provide a user-friendly and efficient solution that can save time and increase productivity.

By using the MySQL image, users can expect the following benefits:

Feature 1: saves time by automating process Y
Feature 2: increases accuracy by providing detailed and real time information
Feature 3: allows for easy collaboration with team members

We are constantly working to improve the Awesome App and add new features that will make the app even more useful. 
Thank you for choosing our MySQL image!

This is just an example, and the content can be tailored according to the specifics of the project. 
The goal is just to give an overview of what's the purpose of the project, and what are the advantages of using it.

## Supported tags and respective `Dockerfile` links

* [`8.0.31`, `8.0`, `8`, `latest`](https://github.com/javanile/mysql/blob/main/versions/8.0.31/Dockerfile)
* [`5.7.28`, `5.7`, `5`](https://github.com/javanile/mysql/blob/main/version/5.7.28/Dockerfile)

## How to use this image

```yaml
version: "3"

services:
  mysql:
    image: javanile/mysql:8.0.31
    environment:
      - MYSQL_DATABASE=database
      - MYSQL_ROOT_PASSWORD=secret
    volumes:
      - ./etc/docker.d:/etc/docker.d
      - ./etc/mysql:/etc/mysql/docker.conf.d
```
