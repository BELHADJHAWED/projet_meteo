#!/bin/bash

# Version 1 - Etape 1 : récupération des données brutes de wttr.in
VILLE="$1"

curl -s "wttr.in/${VILLE}?T&m" -o meteo_brut.txt

# Version 1 - Etape 2 : extraction des températures
# La 1re température trouvée = la température actuelle
ACTUELLE=$(grep -oE '[-+]?[0-9]+(\([-0-9]+\))? °C' meteo_brut.txt | head -n 1 | cut -d' ' -f1 | cut -d'(' -f1 | tr -d '+')

# La 7e température trouvée = demain à midi
DEMAIN=$(grep -oE '[-+]?[0-9]+(\([-0-9]+\))? °C' meteo_brut.txt | head -n 7 | tail -n 1 | cut -d' ' -f1 | cut -d'(' -f1 | tr -d '+')

# Version 1 - Etape 3 : mise en forme lisible
echo "===== Météo pour ${VILLE} ====="
echo "Température actuelle       : ${ACTUELLE}°C"
echo "Prévision de demain (midi) : ${DEMAIN}°C"
echo "================================"

# Phrase courte, préparée pour l'étape 4
RESUME="${VILLE} : ${ACTUELLE}°C - ${DEMAIN}°C"
echo "Résumé : ${RESUME}"