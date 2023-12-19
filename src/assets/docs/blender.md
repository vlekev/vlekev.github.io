# Blender

[Retour au sommaire](index.md)

## Création d'animation
- Object mode > Add > Armature
- Wireframe display + x-ray pour voir mieux
- Click sur armature et passer en edit mode
- maj+d pour dupliquer un os
- pour chainer les os, une fois le premier os placé appuyer sur "E"

## Création d'une vidéo
- Une fois l'animation créée, Dans "output properties" sur le menu en bas à droite, dans output choisir le format d'image voulu et la destination. Ensuite il faut aller dans "render" sur la barre du haut à gauche > "render animation", cela va générer les images de chaque frames dans le dossier choisie dans output.
- Avec ces images on peut maintenant générer une vidéo. Pour cela, il faut aller dans "vidéo editing" dans la barre en haut à droite.
- Dans "output properties" sur le menu a droite, pareil que précèdement choisir le format vidéo voulu ,la destination et en plus la longueur de frame. Ensuite, dans le séquencer appuyer sur "add" > "image/sequence", selectionner toutes les images et appuyer sur "add image strip".Il reste plus qu'a faire de même que précèdement c'est à dire aller dans "render" sur la barre du haut à gauche > "render animation" et vous trouverais la vidéo dans le dossier choisie dans output

## Export vers unreal engine
- Vérifier que le nom du model ne s'appelle pas "Armature"
- Dans "output properties" mettre le framerate à 30
- Dans "scene properties" > units, mettre unit scale à 0.01
- Object > apply > All transform
- Selectionner l'armature et les enfants et exporter en fbx
