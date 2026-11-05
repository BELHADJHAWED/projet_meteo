#!/bin/bash
cd "${0%/*}" || exit 1

ARCHIVE=0
if [ "$1" = "-a" ]; then
    ARCHIVE=1
    shift
fi

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

if [ "$ARCHIVE" = 1 ]; then
    echo "${DATE} - ${HEURE} - ${RESUME}" >> "meteo_$(date +%Y%m%d).txt"
    echo "Relevé archivé dans meteo_$(date +%Y%m%d).txt"
fi
