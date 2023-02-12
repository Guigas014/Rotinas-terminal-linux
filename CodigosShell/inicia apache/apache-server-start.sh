#!/bin/bash

# Executa uma ação passada pelo usuário através de um parametro.
# As ações são: Iniciar o app; Atualizar o app; Encerrar o app; Abrir a Ajuda;

# Inicar o app: inicia o servidor apache e copia todos os arquivos da aplicação 
# para a pasta padrão do apache.
# Atualizar o app: apaga todos os arquivos da pasta padrão e copia novamente 
# todos os arquivos da aplicação para a pasta padrão.
# Encerrar o app: apaga todos arquivos da pasta padrão e para o servidor apache.

# Pasta padrão do server apache: /var/www/html


#Defini as cores padrão das letras.
colorRED="\033[0;31m"
colorGREEN="\033[0;32m"
colorBLUE="\033[0;34m"
colorRESET="\033[0;0m"
colorGRAY="\033[1;30m"

case $1 in
  -i)
    systemctl start httpd
    sudo cp * /var/www/html
    echo -e "\n$colorGREEN aplicação inicializada com sucesso $colorRESET"
    echo -e "$colorGRAY a aplicação está rodando em localhost:80  $colorRESET \n";;
  -u)
    sudo rm /var/www/html/*
    sudo cp * /var/www/html
    echo -e "$colorBLUE aplicação atualizada $colorRESET";;
  -q)
    sudo rm /var/www/html/*
    systemctl stop httpd
    echo -e "$colorGREEN aplicação encerrada com sucesso $colorRESET";;
  -h)
    echo -e "\n Uso: apcha-start [OPÇÃO]
    
    Argumentos obrigatórios para opções: 
    
    -i     inicia o servidor apache e a aplicação \n 
    -u     atualiza toda a aplicação \n
    -q     para o servidor e fecha a aplicação  \n
    -h     mostra essa página de ajuda. ";;
   *)
    echo -e "\n$colorRED Opção inválida\n Execute o comando com a opção -h $colorRESET";;
esac

