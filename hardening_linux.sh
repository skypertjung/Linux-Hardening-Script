#!/bin/bash

#Script de Hardening Inicial para Servidores Linux 
#AUTOR: Skypert

echo "[+] Iniciando actualizacion de repositorios y sistema....."
sudo apt updte && sudo apt upgrade -y

#Configuracion del Firewall(UFW)
#Solo vamos a permitir trafico esencial: SSH(22), HTTP(80) y HTTPS(443)
echo "[+] Configurando el firewall(UFW)...."
sudo ufw default deny incoming 
sudo ufw default allow outgoing 
sudo ufw allow 22/tcp 
sudo ufw allow 80/tcp 
sudo ufw allow 443/tcp 
sudo ufw  --force enable

#Vamos a asegurar el SSH 
echo "[+] Desactivando el acceso root por SHH..."
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart ssh 
#Vamos a realizar una auditoria de los permisos critcos
echo "[+] Buscando archivos con permisos inseguros (777)..."
find /home -type f -perm 0777 > archivos_inseguros.txt
echo "[+] Reporte de archivos con permisos 777 generado en archivos_inseguros.txt"
echo "=============================================================================="
echo "[V] HARDENING COMPLETADO EXITOSAMENTE"
echo "=============================================================================="

