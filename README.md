# Linux-Hardening-Script
Script en Bash para la automatización de políticas de seguridad iniciales en entornos Linux
Este proyecto consiste en un script de automatización en Bash diseñado para aplicar configuraciones de seguridad iniciales (Hardening) en servidores Linux. El objetivo es reducir la superficie de ataque del sistema inmediatamente después de su instalación, siguiendo el principio de menor privilegio.

Funcionalidades Técnicas
El script ejecuta cuatro pilares fundamentales de la seguridad operativa:

Gestión de Parches: Actualiza automáticamente los repositorios y paquetes críticos para mitigar vulnerabilidades conocidas.
Control de Perímetro (Firewall UFW): Implementa una política de "Deny All" por defecto, permitiendo únicamente el tráfico entrante necesario (SSH, HTTP, HTTPS).
Seguridad de Acceso Remoto (SSH): Modifica el archivo de configuración sshd_config para deshabilitar el acceso del usuario root, mitigando ataques de fuerza bruta directos.
Auditoría de Privilegios: Escanea el sistema en busca de archivos con permisos inseguros (777) y genera un reporte técnico (archivos_inseguros.txt) para su posterior revisión.

Instalación y Uso

git clone https://github.com/skypertjung/Linux-Hardening-Script.git
cd Linux-Hardening-ScriptAsignar

permisos de ejecución:
chmod +x hardening_linux.sh

Ejecutar con privilegios de superusuario:
sudo ./hardening_linux.sh

Justificación de Seguridad
Como profesional en formación, entiendo que el Hardening no es un evento único, sino un proceso continuo. Este script aborda:

Mitigación de Riesgos: Al cerrar puertos innecesarios y restringir el acceso root, se eleva significativamente el costo de intrusión para un atacante.
