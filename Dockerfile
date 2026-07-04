# Usamos Ubuntu 22.04 como base
FROM ubuntu:22.04

# Instalamos los paquetes necesarios
RUN apt-get update && apt-get install -y openssh-server sudo python3

# Configuramos el acceso root para SSH
RUN mkdir /var/run/sshd
RUN echo 'root:ansible' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd

# Creamos el usuario ansible por si el playbook lo requiere
RUN useradd -m -s /bin/bash ansible && echo "ansible:ansible" | chpasswd
RUN usermod -aG sudo ansible
RUN echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Exponemos el puerto 22 para SSH
EXPOSE 22

# Iniciamos el servicio SSH
CMD ["/usr/sbin/sshd", "-D"]


