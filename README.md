# SPARQL Query Workspace
I don't believe this is the perfect setup for SPARQL querying however it's what I put in place to easily create SPARQL query and execute them on various endpoints then save the resulting data.
## Installation
To configure & install the workspace run
```sh
chmod u+x manage.sh
./manage.sh install
```

## List available Commands
```
./manage.sh help
```

## Execute a SPARQL query
```sh
# FILENAME: the path containing the sparql query (example.sparql by default)
# ENDPOINT: the endpoint the query must be executed on 
# FORMAT: the data format wanted (CSV by default)
./manage.sh query FILENAME ENDPOINT FORMAT
```
