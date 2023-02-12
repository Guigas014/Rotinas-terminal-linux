#!/bin/bash

#Monta a partição de arquivo do Windows e direciona o terminal para ela. Ou Abre a interface gráfica.

sudo mount /dev/sda1 /media/windows/

if [ $? = 0 ]; then

  opcao=""

  echo "Deseja abrir a pasta no explorador de arquivos?[y/n]"
  read -n1 -s opcao

  if [ $opcao = "y" ]; then
      
    nautilus /media/windows/Users/guilh/Documents/Guilherme.doc/
  
  else

    cd /media/windows/Users/guilh/Documents/Guilherme.doc
    gnome-terminal --tab
 
  fi

else

  echo "Erro ao montar a partição do Windows!"

fi 

