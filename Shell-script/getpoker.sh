#!/bin/bash
set -x
## Declare start and stop ranges
start_range=20
stop_range=200
curl -s "https://pokeapi.co/api/v2/pokemon?offset=${start_range}&limit=${stop_range}" | jq ".results[].name" -r
###### get the count
pokemanecount=$(curl -s "https://pokeapi.co/api/v2/pokemon?offset=${start_range}&limit=${stop_range}" | jq ".results[].name" -r | wc -l)
#############print count
echo ${pokemanecount}