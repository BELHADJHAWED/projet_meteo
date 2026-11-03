#!/bin/bash
VILLE="${1:-Toulouse}"

curl -s "wttr.in/${VILLE}?T&m" -o meteo_brut.txt

ACTUELLE=$(grep -oE '[-+]?[0-9]+(\([-0-9]+\))? °C' meteo_brut.txt | head -n 1 | cut -d' ' -f1 | cut -d'(' -f1 | tr -d '+')

DEMAIN=$(grep -oE '[-+]?[0-9]+(\([-0-9]+\))? °C' meteo_brut.txt | head -n 7 | tail -n 1 | cut -d' ' -f1 | cut -d'(' -f1 | tr -d '+')

echo "===== Météo pour ${VILLE} ====="
echo "Température actuelle       : ${ACTUELLE}°C"
echo "Prévision de demain (midi) : ${DEMAIN}°C"
echo "================================"

RESUME="${VILLE} : ${ACTUELLE}°C - ${DEMAIN}°C"
echo "Résumé : ${RESUME}"


DATE=$(date +%Y-%m-%d)
HEURE=$(date +%H:%M)

echo "${DATE} - ${HEURE} - ${RESUME}" >> meteo.txt
