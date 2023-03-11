#!/bin/bash

#Defini as cores padrão das letras.
colorRED="\033[0;31m"
colorGREEN="\033[0;32m"
colorRESET="\033[0;0m"

# Pergunta o nome da pasta onde o componente será criado.
read -p "Em qual pasta o componente deve ser criado: " locationFolder 

# Pergunta o nome do componente.
read -p "Informe o nome do componente: " compName


#Pesquisa se a pasta existe, salva o caminho entra no diretório e cria a pasta do componente.
folder=`find */$locationFolder -maxdepth 0`

if [ $folder ]; then
  cd $folder
  mkdir $compName 
else
  echo -e "$colorRED O diretório especificado não existe! $colorRESET"
  exit
fi


# Pergunta se o arquivo styles será .css ou .scss ou .ts e cria o mesmo;
read -p "Qual o tipo do arquivo styles CSS[c], SCSS[s], TS[t]: " op
cd $compName

case $op in
  c)
    > styles.css;
    stylesImport="'./styles.css'";;
  s)
    > styles.scss;
    stylesImport="'./styles.scss'";;
  t)
    > styles.ts;
    stylesImport="{ styles } from './styles'";;
  *)
    cd ..
    rm -dr $compName
    echo -e "$colorRED Opção inválida!! $colorRESET"
    exit;;
esac


# Cria o arquivo index.tsx e preenche o mesmo com o script básico.
> index.tsx

echo -e "import React from 'react'; \n
import $stylesImport; \n 
\n
export function $compName() { \n
\t return ( \n

\t ); \n
}" >> index.tsx


echo -e "\n $colorGREEN Componente criado com sucesso! $colorRESET \n"

