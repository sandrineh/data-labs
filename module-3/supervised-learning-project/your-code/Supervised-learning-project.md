# Supervised learning project : 
## Construction et évaluation d’un modèle de classification supervisée (9 nov 2019)

Présentation du projet : 
<a>https://docs.google.com/presentation/d/1fm9FBL9gl2IPELQJmJKF93rfN8c2GlXkBKAc_3tXVnE/edit?usp=sharing</a>  

### Intro

Le dataset sur lequel j'ai travaillé provient du UCI Machine Learning Repository. (lien plus bas)

Les données du set proviennent du recensement de 1994. L’objectif sera ici de <b>prédire si le revenu d’un individu est de plus 50K$ ou pas</b> (grâce à la variable « Income »). 
Comme il n'y a que 2 résultats possible, la méthode de ML sera celle de classification : régression logistic, SVM, forest tree etc…

On pourra tester plusieurs de ces modèles pour déterminer le plus efficace.


### Note sur les données : 

Le dataset contient  32561 lignes et 15 colonnes qui pour la suite pourraient se diviser ainsi : 
    - 14 sont les features 
    - 1 la target. 
6 variables sont numériques, les 9 autres sont catégorielles.

Après recherche, la variable "fnlwgt" représente le poids final, qui correspond au « nombre d'unités de la population cible représentées par l'unité répondante ».

La variable "education_num" correspond au nombre total d'années d'études, elle est la représentation numérique de la variable éducation. Je peux tout de même faire un table de corrélation pour confirmer cette info.

La variable "relationship" représente de la personne interrogée au sein de la famille. 
capital_gain et capital_loss sont des revenus autres que le salaire.

Pour la suite du travail, on pourra supprimer la variable « education » puisque nous avons sa représentation numérique. Ce qui nous évitera pour cette variable de passer par l’étape get_dummies.

Pour ce qui est de la variable « Country », on compte 42 entrées : 41 pays, et 1 de type NC (« ? »).
on pourra pour cette colonne par exemple créer une nouvelle variable qui regrouperait les pays pas continents dès lors que ce n’est pas les USA qui représentent 89,5% des répondants. Pour les lignes NC, je vais les supprimer. ça fera 583 lignes en moins sur 32561. On travaillera donc avec 31978 lignes.

Pour les autres variables, je n'ai rien vu de particulier. Mis à part qu'il faudra vérifier s'il n'y a pas de valeurs manquantes.

------
#### Source : <a>https://archive.ics.uci.edu/ml/datasets/census+income</a>                                                                                            

<b>Data Set Information</b>

Extraction was done by Barry Becker from the 1994 Census database. A set of reasonably clean records was extracted using the following conditions: ((AAGE>16) && (AGI>100) && (AFNLWGT>1)&& (HRSWK>0))

Target : 

* Income : >50K, <=50K : discrete

Listing of attributes:

* age: continuous.
* workclass: Private, Self-emp-not-inc, Self-emp-inc, Federal-gov, Local-gov, State-gov, Without-pay, Never-worked.
* fnlwgt: continuous.
* education: Bachelors, Some-college, 11th, HS-grad, Prof-school, Assoc-acdm, Assoc-voc, 9th, 7th-8th, 12th, Masters, 1st-4th, 10th, Doctorate, 5th-6th, Preschool.
* education-num: continuous.
* marital-status: Married-civ-spouse, Divorced, Never-married, Separated, Widowed, Married-spouse-absent, Married-AF-spouse.
* occupation: Tech-support, Craft-repair, Other-service, Sales, Exec-managerial, Prof-specialty, Handlers-cleaners, Machine-op-inspct, Adm-clerical, Farming-fishing, Transport-moving, Priv-house-serv, Protective-serv, Armed-Forces.
* relationship: Wife, Own-child, Husband, Not-in-family, Other-relative, Unmarried.
* race: White, Asian-Pac-Islander, Amer-Indian-Eskimo, Other, Black.
* sex: Female, Male.
* capital-gain: continuous.
* capital-loss: continuous.
* hours-per-week: continuous.
* native-country: United-States, Cambodia, England, Puerto-Rico, Canada, Germany, Outlying-US(Guam-USVI-etc), India, Japan, Greece, South, China, Cuba, Iran, Honduras, Philippines, Italy, Poland, Jamaica, Vietnam, Mexico, Portugal, Ireland, France, Dominican-Republic, Laos, Ecuador, Taiwan, Haiti, Columbia, Hungary, Guatemala, Nicaragua, Scotland, Thailand, Yugoslavia, El-Salvador, Trinadad&Tobago, Peru, Hong, Holand-Netherlands.