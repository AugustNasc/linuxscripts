#!/bin/bash


echo "Atualizando os pacotes..."

apt update -y

echo "____________________________"


echo "Realizando o upgrade..."

apt upgrade -y

echo "____________________________"


echo "Instalando o Servidor Apache..."

apt install apache2 -y

echo "____________________________"


echo "Instalando o ZIP..."

apt install unzip -y

echo "____________________________"

rm -rf /var/www/html/*

echo "Entrando no diretório tmp..."

cd /tmp

echo "____________________________"

echo "Baixando o projeto..."
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip


echo "Efetuando a descompressão..."
unzip main.zip


echo "Entrando no diretório..."
cd linux-site-dio-main


echo "Copiando os arquivos para o servidor Apache..."
cp * -r /var/www/html/


echo "____________________________"


echo "Apagando o arquivo baixado"

cd /tmp

rm -rf main.zip linux-site-dio-main

echo "____________________________"
echo "Aplicação disponível através do seu localhost"
echo "____________________________"



