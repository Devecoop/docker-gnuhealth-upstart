# docker-gnuhealth-upstart

Docker image for gnuhealth using full-container aproach instead of microservices

# Instructions

    $ docker build -t gnuhealth-upstart .
    $ docker run gnuhealth-upstart &
    $ docker exec -it <container-id> bash
    # (inside the container)
    $ su postgres
    $ createuser -s root
    $ exit
    $ createdb root
    $ trytond
    $ docker inspect <container_id> # To check container IP address
