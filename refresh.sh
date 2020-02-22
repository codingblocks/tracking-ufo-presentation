curl -X DELETE -H "Content-Type: application/json" http://localhost:8083/connectors/datagen-sightings
curl -X POST -H "Content-Type: application/json" --data @connect/datagen-sightings.config http://localhost:8083/connectors
