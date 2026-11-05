# Extracteur Météo - Version 1

## Objectif

Ce projet est un script Shell qui récupère la température actuelle d'une ville
et la prévision météo du lendemain grâce au service [wttr.in](https://wttr.in).
Les informations sont affichées de façon lisible, puis enregistrées sur une
seule ligne dans le fichier `meteo.txt`.

## Équipe

- Hawed Belhadj
- Kiara Nguedam Dusautoir
- Benjamin Pons
- Ismail Ourici
- Mahamat Mahamat Ibni

## Prérequis

- Un terminal Bash (sous Windows : **Git Bash**, installé avec Git pour Windows)
- `curl` (inclus dans Git Bash)
- Git

## Comment exécuter le script

1. Se placer dans le dossier du projet :

   ```bash
   cd projet_meteo
   ```

2. Donner le droit d'exécution au script (une seule fois) :

   ```bash
   chmod +x Extracteur_Météo.sh
   ```

3. Lancer le script avec le nom d'une ville :

   ```bash
   ./Extracteur_Météo.sh Toulouse
   ```

## Fonctionnement

1. `curl` récupère la météo de la ville au format texte sur wttr.in et la
   sauvegarde dans le fichier temporaire `meteo_brut.txt`.
2. `grep`, `head`, `tail`, `cut` et `tr` extraient la température actuelle et
   la prévision de demain à midi.
3. Les deux températures sont affichées de façon lisible.
4. La ligne suivante est enregistrée dans `meteo.txt` :

   ```
   [Date] - [Heure] - Ville : [Température actuelle] - [Prévision du lendemain]
   ```

## Contraintes du projet

Dans le script, seules les commandes `grep`, `head`, `tail`, `tr`, `cut`, `rev`,
`xargs` et `echo` sont autorisées (en plus de `curl` pour récupérer les données).
