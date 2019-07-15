![IronHack Logo](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_d5c5793015fec3be28a63c4fa3dd4d55.png)


# Guided Project: Demonstration of Data Cleaning and Manipulation with Pandas

## Overview

The goal of this project is to combine everything you have learned about data wrangling, cleaning, and manipulation with Pandas so you can see how it all works together. For this project, you will start with this messy data set [Shark Attack](https://www.kaggle.com/teajay/global-shark-attacks/version/1). You will need to import it, use your data wrangling skills to clean it up, prepare it to be analyzed, and then export it as a clean CSV data file.

**You will be working individually for this project**, but we'll be guiding you along the process and helping you as you go. Show us what you've got!


## Sommaire
* [Technologies](#technologies)
* [Setup](#setup)
* [Features : les différentes étapes](#features)
* [Status](#status)


## Technologies
* Python3

## Setup
Dans ce travail de cleaning, j'ai importé les librairies suivantes

    `import pandas as pd`
    `import numpy as np`
    `import re`

## Features : les différentes étapes

### Importation du fichier
    `pd.read_csv('GSAF5.csv', sep=',',engine='python', encoding='latin1')`
### Lecture des infos

Je commence par lire les infos macro du fichier
df.shape
df.info()

### Inspection des colonnes
J'analyse les colonnes et effectue les modifications nécessaires. Par exemple :
    En voulant travailler sur la colonne "Sex", ça indiquait "undefined" --> il y a un problème de syntaxe. il faut donc renommer la colonne pour supprimer l'espace en trop.<br>
    Pareil pour la colonne "Species".
    
### Travail sur la colonne 'SEX'

pour la colonne 'SEX', je corrige pour conserver 3 infos : M, F ou UNKNOWN<br/>
Remarques = 
    *possibilité de faire un dico pour y mettre mes modif désirées
    *Remplacer les espaces par un '_'

### Travail sur la colonne 'FATAL (Y/N)'

Je choisis de ne garder que 3 infos pour la colonne 'Fatal (Y/N)'<br/>

### Travail sur les colonnes 'YEAR' et 'DATE'
1)Je commence par regarder comment se présentent les 2 colonnes avec la fonction `value_counts()`

Je fais 2 travaux en parallèle : <br/>
    a) Je cherche les lignes avec les champs 0 dans la colonne 'YEAR' et, pour les renseigner (si nécessaire), je me sers de la colonne DATE<br/>
    b) je choisis de remplacer ce qui n'est pas en format date par l'info "No date"<br/>
    Pour cela, j'ai créé une df temporaire où je split en 3 colonnes les infos de la colonne 'DATE' et je renomme les colonnes en 'Jour', 'Mois','Annee'<br/>
    Je concatene ce nouveau tableau avec la colonne 'YEAR' de la df d'origine<br/>

A)J'identifie les lignes où YEAR = 0 et où 'Jour' n'est pas un nombre

    1)Je créé une liste des index pour ensuite remplacer les données qui ne sont pas des dates 

    2)Je choisi d'ajouter une colonne nommée 'Date_clean', pour conserver les dates nettoyées.<br/>
        Si j'ai une date je conserve la date<br/>
        Sinon je mets "No date"<br/>

    3)Pour les formats de type 1845-1853, je change aussi les cellules de la colonne 'DATE_CLEAN' par "No date"

    4) Je regarde s'il y a d'autres modifications à réaliser

Pour toutes ces modifications, je n'ai pas eu besoin de toucher à la colonne 'Year'<br/>

B)Je prends maintenant les cas où la colonne 'Year' est renseignée 

    1)Je supprime le mot 'Reported' des cellules pour ne conserver que la date

    2)Je décide de mettre 'No date' pour les dates au format 1xxxs

C)J'applique les dernières modifications

### Travail sur la colonne "TYPE"
pour la colonne 'Type', je fusionne Boat et Boating

### Travail sur la colonne 'COUNTRY'
*mettre tous les pays en Majuscule,<br/> 
*corriger les orthographes<br/>
*remplacer les NaN par "NC"<br/>
*supprimer les espaces en début de chaîne de caractères<br/>
    
### Vérificaton des infos dans les colonnes 'UNNAMED: 22' & 'UNNAMED: 23'

Comme il n'y a pas d'infos exploitables/nécessaires, je les supprime

### Travail sur la colonne "PDF"
Je remplace 'pf' par 'pdf'
    
### Travail sur la colonne "HREF"
Identification des NaN et remplacement des NaN par NC (Non Communiqué) car il est difficile après de faire des 'replace'

### Suppression de la colonne "HREF FORMULA" 
car identique à la colonne "HREF"

### Travail sur la colonne "TIME"
Je remplace les NaN par 'NC'
    
Je change la syntaxe des élements ayant une heure correcte mais mal écrite pour la suite du nettoyage.<br/>
En effet, avec ce format de date je vais pouvoir remplir la colonne "AM_PM" créée et ensuite les changer en AM, PM ou NC.

Creation d'un nouvelle colonne "AM_PM" pour y renseigner les infos suivantes, suivant le format : 
*AM pour le matin
*Pm pour l'apres-midi-PM 
*NC si pas possible à renseigner ou vide

    
### Exportation d'un fichier csv propre

`df.to_csv('shark_cleaning.csv', sep=',', index=False)`

To-do list:
* Passer les colonnes DATE-CLEAN et TIME au format Datetime64 
* s'occuper des colonnes restantes

## Status
Le Projet est: _fini sur les colonnes choisies_

