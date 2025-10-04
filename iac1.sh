#!/bin/bash

echo "Instalando o Figlet" 

apt-get update -y && apt-get install -y figlet

echo "Olá, me chamo Augusto e fiz a criação do Script, lembre-se de alterar sua senha" > /etc/skel/bemvindo.txt

echo "__________________________"

echo "Começando o Script..."

echo "Criando os diretórios..."

mkdir -p /producao /desenvolvimento /teste

echo "Criando os Grupos..." 

groupadd -f gproducao
groupadd -f gdesenvolvimento
groupadd -f gteste

echo "Criando os usuários..." 

useradd -m -c "Novo usuário" -p $(openssl passwd -6 Senha123) -s /bin/bash -G gproducao uprod 
useradd -m -c "Novo usuário" -p $(openssl passwd -6 Senha123) -s /bin/bash -G gdesenvolvimento udesen
useradd -m -c "Novo usuário" -p $(openssl passwd -6 Senha123) -s /bin/bash -G gteste utest

echo "Criando as regras de grupos para diretórios"

chown root:gproducao /producao
chown root:gdesenvolvimento /desenvolvimento
chown root:gteste /teste

chmod 770 /producao
chmod 770 /desenvolvimento
chmod 770 /teste

echo "Gerando Logs para usuários e grupos"

grep "uprod" /etc/passwd > log_users.txt
grep "gproducao" /etc/group > log_groups.txt

grep "udesen" /etc/passwd >> log_users.txt
grep "gdesenvolvimento" /etc/group >> log_groups.txt

grep "utest" /etc/passwd >>  log_users.txt
grep "gteste" /etc/group  >> log_groups.txt

echo "____________________________________________"

figlet Script concluido


