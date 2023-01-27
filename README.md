# projet_sql
Ce projet a pour but de récupérer les données d'une base de donnée préexistante afin de les injecter dans une nouvelle base de données en suivant un classement plus clair et moins répétitif.

## Base de donnée obsolète
![old_db](/images/old_db.PNG)

La BDD donnée durant ce projet propose une méthode de classement peu pratique : en effet, des informations d'un même type se retrouvent éparpillées à travers plusieurs tableaux différents (par exemple, les noms et prénoms des employés de la structure se retrouvent dans les tableaux "Staff", "Coach" et "Player").

### Nouvelle base de donnée

![new_db](/images/new_db.PNG)

Dans le nouveau schéma, les tableaux se lient entre de manière plus intrinsèque et efficace : les données des employés sont désormais regroupés dans un nouveau tableau "Employee_Data", D'une manière générale, les tableaux sont plus nombreux, contiennent moins de colonnes et évitent les répétitions de type de donnée.

#### DBManager

![db_manager](/images/db_manager.PNG)

DBManager est un programme python permettant de mettre à jour la base de donnée avec la nouvelle structure, mais aussi de faire des requêtes plus ou moins spécifiques.

La première option va réinitialiser le fichier "update.db" (ou, dans le cas où il n'existe pas, le créer) et y insérer toutes les données de l'ancienne BDD en suivant la structure de la nouvelle.

La seconde option va faire quelques requêtes de base afin de vérifier le bon fonctionnement de la nouvelle BDD.

La troisième option va permettre à  l'utilisateur d'entrer les requêtes de son choix.

Enfin, la quatrième option va simplement quitter le programme.