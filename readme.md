# Monitoring UFOs with Streaming Architectures

Real-time user experiences and streaming architectures are becoming more and more common. This presentation explains a little bit about common streaming architectures and the components
TODO

## Setup:

- docker-compose up -Vd
- connect to sql, run import.sql
- run connect/refresh.sh to start up the data generator + connectors
- configure Hasura: http://localhost:8080
- start the Kafka streams app
- start the website: www/npm start

## Resources

Coon Alien Icons:
https://react-icons.netlify.com/#/icons/gi

Alien description generator:
https://www.fantasynamegenerators.com/alien-descriptions.php

Demo steps:

1. Show the final product
2. Show how data is generated in Kafka Gen
3. [Show the topic](http://localhost:8000/#/cluster/default/topic/n/sightings/)
4. [Show the connectors](http://localhost:8003/#/cluster/kafka-connect-1/connector/datagen-sightings)
5. Show where the data is in Postgres
6. Show how the data in Postgres is synced
7. Show how the data is joined in the stream app
8. Show how the UI consumes the data
9. Show how the UI can consume streaming data from Postgres via Hasura/GraphQL

# TODO

## Demo

TODO:

- slim down!
- make public
- jaeger

## Demo steps

- Generate data with Kafka Connect Data Gen
- Run the streams app
- Hasura (create, snapshot, subscription)
- Front-End
