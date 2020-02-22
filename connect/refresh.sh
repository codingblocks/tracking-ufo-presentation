curl -X DELETE -H "Content-Type: application/json" http://localhost:8083/connectors/datagen-sightings
curl -X POST -H "Content-Type: application/json" --data @datagen-sightings.config http://localhost:8083/connectors

curl -X DELETE -H "Content-Type: application/json" http://localhost:8083/connectors/alien-types
curl -X POST -H "Content-Type: application/json" --data @alien-types.config http://localhost:8083/connectors