# ¿Cómo configurar el proyecto?
## Aclaraciones
* Partimos de la base de que se está trabajando con una VM con Debian 11.
* Existen los usuarios: root y linux. Ambos con password 1234.
* Para este proyecto se utilizan 4 VM de Virtual Box en modo Bridged Network:

  * Cliente
  * Cliente 2
  * Servidor
  * Proxy

* Suponemos la siguiente infraestructura:
  ```
  Cliente -> Proxy -> Server
  Server -> Proxy -> Cliente
  ```
  Por lo que el Proxy es el intermediario entre los clientes y el servidor.

## Estructura del Proyecto
```
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
```

## Configuraciones - Placa de Interfáz de Red
* Cliente -> [red_cliente](https://github.com/andresbiso/up-2022-1c-computacion-aplicada/blob/main/cliente/red_cliente)
* Cliente 2 -> [red_cliente_2](https://github.com/andresbiso/up-2022-1c-computacion-aplicada/blob/main/cliente/red_cliente_2)
* Servidor -> [red_servidor_aws](https://github.com/andresbiso/up-2022-1c-computacion-aplicada/blob/main/servidor-aws/red_servidor_aws)
* Proxy -> [red_proxy](https://github.com/andresbiso/up-2022-1c-computacion-aplicada/blob/main/proxy/red_proxy)

## Paso General
* Correr el siguiente script para configurar todas las VM con las herramientas necesarias para levatar los distintos proyecto.
[script-install-base.sh](https://github.com/andresbiso/up-2022-1c-computacion-aplicada/blob/main/script-install-base.sh)

## Cliente
* Correr script: [script-iniciar-cliente.sh](https://github.com/andresbiso/up-2022-1c-computacion-aplicada/blob/main/cliente/script-iniciar-cliente.sh)

## Cliente 2
* Correr script: [script-iniciar-cliente-2.sh](https://github.com/andresbiso/up-2022-1c-computacion-aplicada/blob/main/cliente/script-iniciar-cliente-2.sh)

## Servidor
* Primero correr script: [script-iniciar-servidor-aws.sh](https://github.com/andresbiso/up-2022-1c-computacion-aplicada/blob/main/servidor-aws/script-iniciar-servidor-aws.sh)
* Segundo correr script: [scripting-tp-integrador-servidor-aws.sh](https://github.com/andresbiso/up-2022-1c-computacion-aplicada/blob/main/servidor-aws/scripting-tp-integrador-servidor-aws.sh)

  * Este script debe correrse con: sudo . [nombre_script] (para que corra en la sesión actual y no en un fork de bash)

## Proxy
- Correr script: [script-iniciar-proxy.sh](https://github.com/andresbiso/up-2022-1c-computacion-aplicada/blob/main/proxy/script-iniciar-proxy.sh)
