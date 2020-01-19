(MIT)
https://github.com/hasura/graphql-engine/tree/master/install-manifests

## Setup Hasura

Download the Hasura sample docker-compose file

```sh
wget https://raw.githubusercontent.com/hasura/graphql-engine/master/install-manifests/docker-compose/docker-compose.yaml
docker-compose up -d
```

This sets us up with a Postgres database, Hasura's GraphQL engine

## Create the schema in postgres

```sql
DROP TABLE IF EXISTS bitcoin_prices;
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

```graphql
subscription MySubscription {
  bitcoin_prices {
    volume
    open
    low
    high
    date
    close
    cap
  }
}
```

Insert a record

```graphql
insert into bitcoin_prices (date, open, high, low, close, volume, cap) values (
    '2010-01-01',1,1,1,1,1,1
);
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

```javascript
import ApolloClient from 'apollo-boost'
import { gql } from 'apollo-boost'

const client = new ApolloClient({
  uri: 'http://localhost:8080/v1/graphql'
})

client
  .query({
    query: gql`
      subscription MySubscription {
        bitcoin_prices {
          cap
          close
          date
          high
          low
          volume
          open
        }
      }
    `
  })
  .then(result => console.log(result))
```
