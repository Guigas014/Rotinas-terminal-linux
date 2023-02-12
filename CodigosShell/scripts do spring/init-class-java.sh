#!/bin/bash

#Defini as cores padrão das letras.
colorRED="\033[0;31m"
colorGREEN="\033[0;32m"
colorRESET="\033[0;0m"


# Pergunta o nome da pasta onde a classe será criada.
read -p "Em qual pasta a classe deve ser criada: " locationFolder


#Pesquisa se a pasta existe, salva o caminho e entra no diretório.
cd src/main/java

#folder=`find */*/*/$locationFolder -maxdepth 0`
folder=`find -name $locationFolder`

if [ $folder ]; then
  cd $folder
else
  echo -e "$colorRED O diretório especificado não existe! $colorRESET"
  exit
fi


# Pergunta o nome do arquivo e testa se é válido.
read -p "Informe o nome do arquivo: " className

if [ -z $className  ]; then
  echo -e "$colorRED Você deve digitar um nome para o arquivo! $colorRESET"
  exit
fi

fileTest=`find -name $className.java`

if [ $fileTest ]; then
  echo -e "$colorRED O arquivo já existe! $colorRESET"
  exit
fi


#perguntar se é classe, interface ou enum
read -p "Esse arquivo é uma Classe[c], Interface[i] ou Enum[e]: " op

case $op in
  c)
    title="class $className";;
  i)
    title="interface $className extends JpaRepositoryImplementation<id, Long>";;
  e)
    title="enum $className";;
  *)
    echo -e "$colorRED Opção inválida!! $colorRESET"
    exit;;
esac


# Cria o arquivo Java e preenche o mesmo com o script básico.
> temp.txt

#Texto do arquivo
echo -e "package $folder;
\n
public $title { 
\n
}" >> temp.txt

#resolve o caminho do package
tr -d '.' <temp.txt> temp1.txt
tr '/' '.' <temp1.txt> $className.java 
rm temp.txt temp1.txt


echo -e "\n $colorGREEN Classe criado com sucesso! $colorRESET \n"

