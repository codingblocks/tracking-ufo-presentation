# Monitoring UFOs with Streaming Architectures

TODO: What this talk is about

### Touch up slides

### Practice run

### Video

## Demo description

Fake UFO sightings using Kafka DataGen:

Time
Type
Duration
Description

## Setup Hasura

This sets us up with a Postgres database, Hasura's GraphQL engine

Create a maps API key

```sh
docker-compose up -d
cd connect
bash ./refresh.sh
cd ../www
npm install
npm start
```

We can connect to Postgres via localhost:5432, user "postgres" with no password.

## Create the schema in postgres

```sql
CREATE TABLE bitcoin_prices (
  date date,
  open bigint,
  high bigint,
  low bigint,
  close bigint,
  volume bigint,
  cap bigint
);
```

## Hasura setup

1. http://localhost:8080/console
2. Data (track)
3. GraphQL Subscription
4. (separate tab) MyMutation

```graphql
subscription {
  bitcoin_prices {
    close
    cap
    date
    high
    low
    open
    volume
  }
}
```

```graphql
mutation {
  insert_bitcoin_prices(
    objects: {
      cap: 1
      close: 2
      date: "2020-01-01"
      high: 4
      low: 5
      open: 6
      volume: 7
    }
  ) {
    affected_rows
    returning {
      date
    }
  }
}
```

yay! the subscription works, let's see what it looks like on from a front-end perspective

```bash
create-react-app www
cd www

# https://www.apollographql.com/docs/react/get-started/
npm install apollo-boost @apollo/react-hooks graphql

# https://docs.hasura.io/1.0/graphql/manual/guides/integrations/apollo-subscriptions.html
npm install --save apollo-client apollo-link-ws apollo-link-http apollo-link apollo-utilities apollo-cache-inmemory subscriptions-transport-ws

npm start
```

Clear out the boilerplate, add this to the index.js

```javascript
import ApolloClient from 'apollo-client'
import { WebSocketLink } from 'apollo-link-ws'
import { HttpLink } from 'apollo-link-http'
import { split } from 'apollo-link'
import { getMainDefinition } from 'apollo-utilities'
import { InMemoryCache } from 'apollo-cache-inmemory'
import { ApolloProvider } from '@apollo/react-hooks'

const httpLink = new HttpLink({
  uri: 'http://localhost:8080/v1/graphql' // use https for secure endpoint
})

// Create a WebSocket link:
const wsLink = new WebSocketLink({
  uri: 'ws://localhost:8080/v1/graphql', // use wss for a secure endpoint
  options: {
    reconnect: true
  }
})

// using the ability to split links, you can send data to each link
// depending on what kind of operation is being sent
const link = split(
  // split based on operation type
  ({ query }) => {
    const { kind, operation } = getMainDefinition(query)
    return kind === 'OperationDefinition' && operation === 'subscription'
  },
  wsLink,
  httpLink
)

// Instantiate client
const client = new ApolloClient({
  link,
  cache: new InMemoryCache()
})

// Wrap the App in ApolloProvider, pass the client
```

## Resources

https://react-icons.netlify.com/#/icons/gi

Alien generator:
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

x Get a map showing up on a page
x Get a US map showing
x Dynamically add / remove nodes to the map
x Click on a node to have info show up
x DataGen the node data
x Kafka connector to db

- map pull from Hasura!!
- offline version
- better data
- slim down!
- jaeger

Slides:

- Architecture diagrams
- 3 Factor, Lambda, Kappa
- Event-at-a-time processing
- Basic building blocks
- Practice x 3

Setup:

- docker-compose up -Vd
- schema exists? import.sql
- connectors running? refresh.sh
- start the website: www/npm start
