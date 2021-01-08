
# Install

This should instal and startup a working Docker instance

### Checkout App
```
clone git@github.com:ryanmarshall/AppLandQL.git

# cd AppLandQL/
```

copy "appland.results.JVCLD-42862-with-info.json" to the /data/ folder


### Build Docker

```
# docker-compose up
```

### Log into web instance
```
# docker exec -it #{docker_id} bash
```

### Load rails data
```
# rake db:migrate

# rake db:seed

# rake load_json:parse
```

### Load query browser
http://localhost:3000/graphiql

API URL http://localhost:3000/graphql