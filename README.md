# Extracteur Météo

## Objectif
Script Shell qui récupère la température actuelle et la prévision du
lendemain d'une ville via le service wttr.in, et les enregistre sur une
ligne dans `meteo.txt`.

Format : `AAAA-MM-JJ - HH:MM - Ville : Température actuelle - Prévision`

## Exécution

    chmod +x Extracteur_Météo.sh
    ./Extracteur_Météo.sh Paris      # ville donnée en argument
    ./Extracteur_Météo.sh            # ville par défaut : Toulouse

## Automatisation avec cron

1. Ouvrir la configuration cron : `crontab -e`
2. Ajouter une ligne de la forme `m h dom mon dow commande` :

       */30 * * * * /bin/bash /mnt/c/Users/HP/projet_meteo/Extracteur_Météo.sh Toulouse >> /mnt/c/Users/HP/projet_meteo/cron.log 2>&1

   Les 5 champs sont : minute, heure, jour du mois, mois, jour de la
   semaine. `*/30` signifie « toutes les 30 minutes ».
3. Vérifier : `crontab -l`
4. Sous WSL, le démon cron doit être démarré : `sudo service cron start`
   (vérification : `sudo service cron status`)

## Versions
- v1.0 : script de base
- v2.0 : ville par défaut + cron
