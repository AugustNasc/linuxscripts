#!/bin/bash

echo "Instalando o Figlet" 

sudo apt-get install figlet

touch /etc/skel/bemvindo.txt

echo "Olá, me chamo Augusto e fiz a criação do Script, lembre-se de alterar sua senha" > /etc/skel/bemvindo.txt

echo "__________________________"

echo "Começando o Script..."

echo "Criando os diretórios..."

mkdir /producao
mkdir /desevolvimento
mkdir /teste

echo "Criando os Grupos..." 

groupadd gproducao
groupadd gdesenvolvimento
groupadd gteste

echo "Criando os usuários..." 

useradd uprod -m -c "Usuário para PROD" -p $(openssl passwd -crypt 123) -s /bin/bash -G gproducao 
useradd udesen -m -c "Usuário para DEV" -p $(openssl passwd -crypt 123) -s /bin/bash -G gdesenvolvimento
useradd utest -m -c "Usuário para Test" -p $(openssl passwd -crypt 123) -s /bin/bash -G gteste 

echo "Criando as regras de grupos para diretórios"

chown root:uprod /producao
chown root:udesen /desenvolvimento
chown root:utest /teste

chmod 770 /producao
chmod 770 /desenvolvimento
chmod 770 /teste

figlet Fim do Script.


cat /etc/passwd | grep "uprod" > users.txt && cat /etc/group | grep "gproducao" > group.txt
cat /etc/passwd | grep "udesen" >> users.txt && cat /etc/group | grep "gdesenvolvimento" >> group.txt
cat /etc/passwd | grep "utest" >> users.txt && cat /etc/group | grep "gteste" >> group.txt


echo "____________________________________________"



