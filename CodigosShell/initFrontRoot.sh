#!/bin/bash

#Defini as cores padrão das letras.
colorRED="\033[0;31m"
colorGREEN="\033[0;32m"
colorRESET="\033[0;0m"


#Pergunta o nome do projeto
read -p "Qual o nome do projeto: " projName

#Testa se já existe um diretório com o nome do projeto
folder=`find $projName -maxdepth 0`

if [ $folder ]; then
  echo -e "$colorRED Um projeto com esse nome já existe! $colorRESET"
  exit
else
  mkdir $projName
  cd $projName
fi


#Criar os arquivos CSS e JS
> styles.css
> scripts.js

#Criar o arquivo HTML
> index.html

echo -e '<!DOCTYPE html> 
<html lang="pt-BR"> 
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>$projName</title>

    <link rel="stylesheet" href="styles.css" type="text/css" media="all">
  </head>

  <body>
\n
    <script src="scripts.js"></script>
  </body>
</html>' >> index.html

vim index.html

