#!/bin/bash

# Version 1 - Etape 1 : récupération des données brutes de wttr.in
VILLE="$1"

curl -s "wttr.in/${VILLE}?T&m" -o meteo_brut.txt