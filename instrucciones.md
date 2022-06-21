# ¿Cómo configurar el proyecto?
## Aclaraciones
a. Partimos de la base de que se está trabajando con una VM con Debian 11.
b. Existen los usuarios: root y linux. Ambos con password 1234.
c. Para este proyecto se utilizan 4 VM de Virtual Box en modo Bridged Network:
1. Cliente
2. Cliente 2
3. Servidor
4. Proxy
d. Suponemos la siguiente infraestructura:
Cliente -> Proxy -> Server
Server -> Proxy -> Cliente
Por lo que el Proxy es el intermediario entre los clientes y el servidor.

## Base
El proyecto con lo siguientes archivos:
/
|- cliente/
|-- red_cliente -> configuración de placa de interfaz de red para cliente
|-- red_cliente_2 -> configuración de placa de interfaz de red para cliente 2
|-- script-iniciar-cliente.sh -> script que configura placa de interfaz de red del cliente
|-- script-iniciar-cliente-2.sh -> script que configura placa de interfaz de red del cliente 2
|-- script-reset-cliente.sh -> script que vuelve VM a estado inicial previo a script-iniciar-cliente.sh
|-- script-reset-cliente-2.sh -> script que vuelve VM a estado inicial previo a script-iniciar-cliente-2.sh
|- proxy/
|-- crontab_proxy -> configuración de cron para proxy (para usuario root)
|-- dia_laboral.cfg -> configuración de iptables para día laboral
|-- dia_no_laboral.cfg -> configuración de iptables para día no laboral
|-- red_proxy -> configuración de placa de interfaz de red para proxy
|-- script-generador-dia-laboral.sh -> script que genera configuración de iptables dia_laboral.cfg
|-- script-generador-dia-no-laboral.sh -> script que genera configuración de iptables dia_no_laboral.cfg
|-- script-iniciar-proxy.sh -> script que configura placa de interfaz de red y cron del proxy
|-- script-reset-proxy.sh -> script que vuelve VM a estado inicial previo a script-iniciar-proxy.sh
|- servidor/
|-- red_servidor_aws -> configuración de placa de interfaz de red para servidor aws
|-- scripting-tp-integrador-servidor-aws.sh -> script que configura la VM para funcionar como el apartado "Servidor Web" del trabajo práctico
|-- scripting-tp-integrador.sh -> script que funciona como el apartado "Scripting" del trabajo práctico
|-- script-iniciar-server-aws.sh -> script que configura placa de interfaz de red del servidor aws
|-- script-reset-server-aws.sh -> script que vuelve VM a estado inicial previo a script-iniciar-server-aws.sh y scripting-tp-integrador-servidor-aws.sh.
|- script-install-base.sh -> script que instala los paquetes base para poder correr el proyecto en todas las VM y agrega el usuario linux a archivo sudoers.