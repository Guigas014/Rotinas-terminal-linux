#!/bin/bash

# Inicia um backend no node até o teste inicial do servidor.


#Pergunta o nome do projeto
read -p "Digite o nome do projeto backend: " nomeProj

#Cria a pasta do projeto e entra na mesma
mkdir $nomeProj
cd $nomeProj

#inicia o projeto
yarn init --yes

#cria o script de inicialização no arquivo package.josn
head -n -2 package.json > package-tmp.json
mv package-tmp.json package.json
 
echo -e "  \"license\" : \"MIT\",
  \"scripts\" : {
    \"dev\" : \"ts-node-dev src/server.ts\"
  }
}" >> package.json

#cria o arquivo .gitignore
echo "/node_modules" >> .gitignore


#instala as dependências do projeto e inicia o typescript
comandos=("add express" "add typescript ts-node-dev -D" "add @types/express -D" "tsc --init") 
cont=0

while [ $cont -ne 4 ]; do
  yarn ${comandos[$cont]}
  if [ $? -ne 0 ]; then
    break
  else
    cont=$[ $cont + 1 ]
  fi
done

echo -e "\nDependências instaladas com sucesso!!\n"


#if [ $? -eq 0 ]; then
  #yarn add express
  #if [ $? -eq 0 ]; then
    #yarn add typescript ts-node-dev -D
    #if [ $? -eq 0 ]; then
      #yarn add @types/express -D
      #if [ $? -eq 0 ]. then
        #yarn tsc --init
        #if [ $? -eq 0 ]; then
          #echo "Dependências instaladas com sucesso!!"
        #else
      #else
    #else
  #else
#else
  #break
#fi

#cria a pasta src e o arquivo server.ts
mkdir src
cd src
touch server.ts

echo -e "import express from 'express' \n
const app = express() \n
app.get('/', (req, res) => res.send('Oi, tudo bem?')) \n
app.listen(3000, () => console.log('Server is running'))" >> server.ts

#testa o projeto
yarn dev



