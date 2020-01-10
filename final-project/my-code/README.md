# [Instagram : Prédiction des likes pour des comptes d'éditeurs et de libraires]

**[Sandrine Henry]**

**[IronHack Paris Juin 2019]**

## Overview

Sélection et apprentissage supervisé d'un modèle prédiction - XGBOOST - afin de déterminer le nombre de likes des publications sur Instagram. Et plus particulièrement pour deux acteurs du secteur du livre : les éditeurs et libraires.
![Editeurs_libraires_instagram](https://github.com/sandrineh/data-labs/blob/master/final-project/my-code/images/edi_lib_insta.png")

* Technologies and tools :
	* Python
	* Statistical analysis
	* Data visualization
	* Jupyter Notebook
	* Tableau
	* Machine Learning
	* Natual Language Processing
    

## Data Preparation

### Overview:

Partie d'une base de donnée construite précédement, je n'ai conservé que les comptes instagram. J'ai ensuite scrappé les données désirées à l'aide des librairies `SELENIUM` pour automatiser le chargement des pages et `BEAUTIFULSOUP`.

### Data Ingestion

<a src ="https://github.com/sandrineh/data-labs/blob/master/final-project/my-code/PROJET_FINAL_ETAPE_WEBSCRAPING.ipynb">Webscraping</a> et <a src="https://github.com/sandrineh/data-labs/blob/master/final-project/my-code/PROJET_FINAL_ETAPE_WEBSCRAPING_SUITE.ipynb">Webscraping suite</a>

### Data Wrangling and Cleaning

Pour enrichir le dataset, je me suis ensuite référée aux lectures relatives aux bonnes pratiques sur instagram qui mettent en avant les notions de jour, d’heure de publication, de longueur de texte, du bon usage des hashtags...j’ai créé les colonnes en conséquence. 
J’ai par la suite supprimé les colonnes relatives à la localisation trop peu renseignées et enfin j’ai supprimé les doublons.
<br/>
Au final je me suis retrouvé avec un dataset de 23K publications (lignes) et 29 colonnes.

### Data Storage

* Dump your data to a MySQL database and/or a `.csv` file.
**Dataset** : <a src="https://github.com/sandrineh/data-labs/tree/master/final-project/my-code/data">projet_ironhack_insta_final.csv</a>

## Data Analysis

### Overview

Overview the general steps you will go through to analyze your data in order to test your hypothesis.

### Data Exploration and Visualization

* Document each step of your data exploration and analysis.
* Print charts to demonstrate the effect of your work. Charts make your presentation look good too.
* If you use ML in your final project, also describe your feature selection process.

### Model Training and Evaluation

* Train your ML model, produce results, and evaluate.
* This is an iterative process. Try your best to improve your model performance by:
	* More data cleaning.
	* Try different models and select one that is the simplest yet produce the best result.
	* Try advanced techniques and see if they improve the result.

## Conclusion
![WebApp_Prediction_instagram](https://github.com/sandrineh/data-labs/blob/master/final-project/my-code/images/le_test_ultime.png")

* Summarize your data analysis result.
* State your conclusion of your hypothesis testing.
* Interpret your findings in terms of the human-understandable question you try to answer.
* What are the next steps?