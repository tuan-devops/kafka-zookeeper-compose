# Use the Zookeeper version 3.4.14 as the base image
FROM zookeeper:3.4.14

# Modify the default Zookeeper port in the entrypoint script to use the environment variable $ZOO_PORT
RUN sed -i 's/2181/$ZOO_PORT/g' /docker-entrypoint.sh
