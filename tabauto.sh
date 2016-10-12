#!/bin/sh
echo donner le nom de lentree
read entree 
echo donner le nom du module
read module 


mkdir ../$entree/modules/$module 


cp -r allproducts/* ../$entree/modules/$module #Copie du contenu du repertoire allproducts dans le repertoire ../$entree/module/$module

cd ../$entree/modules/$module
find . -name "allproducts.php" -print | xargs sed -i 's/allproducts/'$module'/g' # Dans allproducts.php, on remplace 'allproducts' par $entree
find . -name "allproducts.php" -print | xargs sed -i 's/Allproducts/'${module^}'/g' # ${module^} : on met le premier caractere de $module en majuscule
find . -name "allproducts.php" -print | xargs sed -i 's/ALLPRODUCTS/'${module^^}'/g' # ${module^} : on met $module en majuscule
find . -name "*.tpl" -print | xargs sed -i 's/allproducts/'$module'/g'
mv allproducts.php $module.php  # On renomme le fichier allproducts.php en $module.php
mv views/templates/hook/allproducts.tpl views/templates/hook/$module.tpl




cd ../../themes/default-bootstrap/modules # je vais dans module de themes 
mkdir $module
cp -r allproducts/* $module
find . -name "*.tpl" -print | xargs sed -i 's/allproducts/'$module'/g'
cd $module
mv allproducts.tpl $module.tpl



cd ../../
cp allproduct-list.tpl $module-list.tpl
find . -name "*.tpl" -print | xargs sed -i 's/allproducts/'$module'/g'

