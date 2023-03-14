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

#Pesquisa se existe um componente com o nome digitado.
componentExist=`find $folder/$compName -maxdepth 0`

if [ $folder ]; then
  if [ $componentExist ]; then
    echo -e "$colorRED Esse componente já existe! $colorRESET"
    exit
  else
    cd $folder
    mkdir $compName 
  fi
else
  echo -e "$colorRED O diretório especificado não existe! $colorRESET"
  exit
fi


# Pergunta se o arquivo styles será .css ou .scss ou .ts e cria o mesmo;
read -p "Qual o tipo do arquivo styles CSS[c], SCSS[s], TS[t]: " op
cd $compName

#Conteúdo do arquivo styles CSS e SCSS.
styleContentCSS=`echo -e "@import url('https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&display=swap');
  
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  
  font-family: 'Lato', sans-serif;
}"`   

#Conteúdo do arquivo styles TS.
styleContentTS=`echo -e "import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});"`


case $op in
  c)
    > styles.css;
    stylesImport="'./styles.css'"
    echo "$styleContentCSS" >> styles.css
    reactNativeImport=""
    reactNativeView="";;
  s)
    > styles.scss;
    stylesImport="'./styles.scss'"
    echo "$styleContentCSS" >> styles.scss
    reactNativeImport=""
    reactNativeView="";;
  t)
    > styles.ts;
    stylesImport="{ styles } from './styles'"
    echo "$styleContentTS" >> styles.ts
    reactNativeImport="import { View, Text } from 'react-native';"
    reactNativeView="<View><Text>Hello ReactNative</Text></View>";;
  *)
    cd ..
    rm -dr $compName
    echo -e "$colorRED Opção inválida!! $colorRESET"
    exit;;
esac


# Cria o arquivo index.tsx e preenche o mesmo com o script básico.
> index.tsx

echo -e "import React from 'react'; 
$reactNativeImport\n 
import $stylesImport;  
\n
export function $compName() { \n
  return ( 
    $reactNativeView
  ); 
}" >> index.tsx


echo -e "\n $colorGREEN Componente criado com sucesso! $colorRESET \n"

