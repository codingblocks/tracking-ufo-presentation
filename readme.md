# Monitoring UFOs with Streaming Architectures

Streaming data is an important component of building interactive and real-time experiences. In this presentation, we'll talk about why those experiences are important and are becoming increasingly more common, and we'll look at how organizations are building these experiences.

App: http://localhost:3000
Topics: http://localhost:8000
Connectors: http://localhost:8003
Hasura: http://localhost:8080

## Setup:

- docker-compose up -Vd
- connect to sql, run import.sql
- run connect/refresh.sh to start up the data generator + connectors
- configure Hasura: http://localhost:8080
- start the Kafka streams app
- start the website: www/npm start


## Resources

Cool Alien Icons:
https://react-icons.netlify.com/#/icons/gi

Alien description generator:
https://www.fantasynamegenerators.com/alien-descriptions.php
