# Práctica de Ansible y Docker

Automatización de configuración de servidores Ubuntu usando Ansible y Docker.

## Archivos incluidos:
- `Dockerfile`: Configuración del servidor Ubuntu con SSH y usuario ansible.
- `docker-compose.yml`: Despliegue de los 5 nodos.
- `inventario.ini`: Inventario de los servidores.
- `ansible.cfg`: Configuración de Ansible.
- `playbook.yml`: Automatización para actualizar APT, crear usuario, carpeta, archivo y instalar aplicaciones.

## Cómo ejecutar:
1. `docker compose up -d`
2. `ansible-playbook -i inventario.ini playbook.yml`
