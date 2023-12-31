#!/bin/bash
### define start and stop ranges
startrange=10
stoprange=30
## List the names from the pokemanAPI
curl -s "https://pokeapi.co/api/v2/pokemon?offset=${startrange}&limit=${stoprange}"  | jq .results[].name -r
## count the names
count=$(curl -s "https://pokeapi.co/api/v2/pokemon?offset=${startrange}&limit=${stoprange}"  | jq .results[].name -r| wc -l)
##print the count
echo "The number of items are $count"
