# Entorno de producción

- Escalamiento: Capacidad de ajustar la infra a las necesidades de cada momento.
- Alta disponibilidad


App1: 
    App departamental
    dia 1       100 usuarios
    dia 100     100 usuarios
    dia 1000    100 usuarios

App2: modelo tradicional
App de un servicio/producto que ofrezco y va tirando!
    dia 1:      100 usuarios 
    dia 100:   1000 usuarios    Escalado vertical: MAS MAQUINA!
    dia 1000: 10000 usuarios

App3: esto es internet!
    dia n:      1000 usuarios
    dia n+1:    1000000 usuarios
    dia n+2:    100 usuarios
    dia n+3:    10000000 usuarios

    Web telepi:
        hora 00:00    0 ... cerrado
        hora 06:00    0 usuarios
        hora 12:00    10 usuarios
        hora 14:00    1000 usuarios     Escalado horizontal: MAS MAQUINAS! (o menos)
        hora 16:00    50 usuarios
        hora 18:00    200 usuarios
        hora 20:00    100000000000000 usuarios

---
JBoss/Wildfly       |
Weblogic            |   Servidores de aplicaciones JAVA
Websphere           |

    app JAVA: Consumen mucha RAM
    La misma app montada en C++/C consume menos RAM

    JAVA/JS/PYTHON es un lenguaje que destroza la RAM (hace un uso poco eficiente de la memoria RAM) ... bueno o malo? Simplemente es un FEATURE del lenguaje.

    1º JAVASCRIPT
    2º PYTHON
    3º JAVA

    C++: 250 h x 60€/hora =     15000€
    JAVA: 200 h x 50€/hora =    10000€
                            - ----------
                                 5000€

    Y 2 pastillas de RAM pa'l servidor: 1000€



---

# DEVOPS

Una cultura, una filosofía... un movimiento en pro de la automatización... de qué?
TODO lo que hay entre dev ----> ops

En el mundo Sistemas se usan:
- Ansible
- Puppet
- Chef
- Kubernetes
  - Redhat (Openshift)
  - Tamzu (VMware)
- Terraform

Todas estar herramientas nos permiten automatizar trabajos... como hacíamos antes con los scripts de la bash. Con una diferencia GIGANTE: el tipo de lenguaje que usan: LENGUAJES DECLARATIVOS, en contraposición con los scripts que son LENGUAJES IMPERATIVOS.




----


Hoy en día TI:

- Devops
- Clouds
- Contenedorización


---

OpenStack
    Redhat OpenStack
    Canonical: Ubuntu: OpenStack

Me permite montar un cloud privado.


---

Arquitectura/Infraestructura hiperconvergente

Almacenamiento ***    Al menos 3
Red
Computo


Cluster de Nodos: 
    NODO (servidor) 1: Sobre cada nodo, nutanix monta su SO: 
                            AOS (Acropolis Operating System) + AHV (Acropolis Hypervisor)
        - Almacenamiento
        - Red
        - Computo
    NODO (servidor) 2
        - Almacenamiento
        - Red
        - Computo
    NODO (servidor) 3
        - Almacenamiento
        - Red
        - Computo
      
    PRISMA: Interfaz gráfica de gestión de la infraestructura hiperconvergente de Nutanix.

Ofreces servicios de almacenamiento, red y computo (virtualizados) a tus clientes.
Con esa infra hiperconvergente (nutanix) puedes montar un cloud privado, que provea servicios de infraestructura internos en mi empresa.... igual que con openstack.

Cloud híbridos.
Parte de mi infra en un cloud publico y parte en mi infraestructura interna (la proveo mediante un cloud privado).

Te ofrezco una herramienta que te permita gestionar clouds públicos y privados de manera unificada.

Multi-cloud: Gestionar varios clouds públicos y privados de manera unificada.
NC2: Nutanix cloud cluster: Nos permite gestionar varios clouds públicos de la misma forma que gestionamos nuestro cloud privado (hiperconvergente) de nutanix.

---

Terraform... software creado por Hashicorp que nos ofrece:
    - Un lenguaje declarativo, llamado HCL, que me permite definir infraestructura: IaC (Infraestructure as Code)
    - Un interprete de ese lenguaje que me permite hacer operaciones con la infraestructura que he definido en HCL contra un determinado proveedor de cloud (AWS, Azure, Google Cloud, Nutanix, Openstack, etc)

Si está tan impuesto en el mercado... y permite trabajar contra cualquier cloud...
para qué nutanix multi-cloud infrastructure? Pues terraform ... ya está!

Terraform se basa en el concepto de proveedor.
Un proveedor es un plugin que permite trabajar contra un cloud/proveedor determinado.

   mi-infra1.hcl -> terraform ----> terraform/aws    --->  aws cli   --> aws
                                     ^ librería creada por Hashicorp
   mi-infra2.hcl -> terraform ----> terraform/azure  --->  az cli    --> azure
                                     ^ librería creada por Hashicorp

   mi-infra3.hcl -> terraform ----> terraform/aws    --->  aws cli   --> aws
                              ----> terraform/azure  --->  az cli    --> azure

El problema es que la sintaxis de los ficheros: mi-infra1.hcl, mi-infra2.hcl, mi-infra3.hcl es diferente dependiendo del proveedor que usemos (librería que usemos).
Dicho de otra forma: 
Un fichero que define una infra para aws, es totalmente diferente a un fichero que define una infra equivalente para azure.


AWS                 NC2 -> PRISMA
 vpc:
    subnet
    security_group
  ec2:
    vm1
    vm2
  ebs:
    - disco1
    - disco2
    - disco3
AZURE:              NC2 -> PRISMA
  vnet:
    subnet
    nsg
  vm:
    vm1
    vm2
  disk:
    - disco1
    - disco2
    - disco3

NUTANIX HCI:        PRISMA
cluster:
    nodo1
    nodo2
    nodo3
vm:
    vm1
    vm2
disco:
    - disco1
    - disco2
    - disco3

 infra.hcl -->  Terraform -> nutanix -> PRISMA

---     

# Redhat Openshift

Distro de kubernetes de Redhat
Es un kubernetes vitaminizado. con añadidos.

Gestionar/Operar un entorno de producción (almacenamiento, cómputo, red... seguridad)
basado en Contenedores.

Los contenedores los podemos ver como una alternativa/complemento a las máquinas virtuales.
Contenedor: Un entorno aislado dentro de un SO con Kernel Linux donde ejecutar procesos.
Entorno aislado:
    - Su propia conf de red: Su propia IP
    - Su propio sistema de archivos
    - Sus propias variables de entorno
    - Puede tener limitaciones de recursos (CPU, RAM, disco)

Ayudan a resolver casi todos los mismos problemas que nos ayudaban a resolver las máquinas virtuales, pero con una diferencia GIGANTE: los contenedores son mucho más ligeros que las máquinas virtuales.

Red
    Nodo1 96 cores   - Kubernetes    (pod1-weblogic-app1 - 8 cores)
    Nodo2   - Kubernetes    
    Nodo3   - Kubernetes    (pod-mariadb) (pod2-weblogic-app1)

Openshift me ofrece GESTION DE MAQUINAS.
Puedo definir plantillas de máquinas y pools de máquinas.
Y cuando me hacen falta máquinas, Openshift se encarga de crearlas y destruirlas.
crearlas y destruirlas = le pido a un cloud que me de una máquina y la destruyo cuando ya no la necesito.
Para eso usa Terraform.


---

Cloud:

Datacenter: 
Servidores (HIERRO)     >>>>>     VMs
Redes                   >>>>>     VPCs
Almacenamiento          >>>>>     Volumenes de Almacenamiento

Nutanix en los clouds toma varias máquinas físicas
Y les monta el AOS y el AHV
Y se encarga de generar máquinas virtuales a partir de esas máquinas físicas.

---

Cephfs: Tipo de sistema de archivos distribuido

Implementaciones de Ceph:
Redhat Ceph


Servidor1
    redhat ceph
    nvme1
    ssd1
    hdd1
    hdd2
    hdd3
Servidor2
    redhat ceph
    nvme1
    ssd1
    hdd1
    hdd2
    hdd3
Servidor3
    redhat ceph
    nvme1
    ssd1
    hdd1
    hdd2
    hdd3
Servidor8

---
Intro a terraform en general
---
Labs simulados de creación y gestión de clusters, vms... con nutanix sobre clouds
---
Tendrémos que configurar en NC2 nuestra cuenta de amazon.
Cluster de Nodos en Nutanix (NC2) -> AWS
---
VMs         Consola gráfica de Nutanix
Imagenes        + terraform (proveedor oficial de nutanix para terraform)
Redes
...

---

# Terraform

Programa de Hashicorp que nos ofrece:
- Una sintaxis DECLARATIVA (lenguaje) HCL que permite definir infraestructura (en general recursos) que obtener de un proveedor (cloud)
- Un intérprete de scripts que montarermos con esa sintaxis.

## Sintaxis declarativa

Vamos a estar escribiendo código... y usaremos un lenguaje... Los lenguajes tienen paradigmas:
- Imperativo
- Procedural
- Funcional
- Orientado a objetos
- Declarativo
 
Paradigma: Una forma de usar el lenguaje para transimitir una información.

    Felipe, SI hay algo que no sea una silla debajo de la ventana, 
        Quitala!
    Felipe, Si (IF) no hay una silla, entonces:
        Felipe, SI no hay silla, 
            vete al ikea a por una silla
        Felipe, pon una silla debajo de la ventana.     Imperativa
    
    mkdir: Intro a terraform en general
        make directory silla!                       Imperativo
        
    El problema del lenguaje imperativo es que pierdo de vista lo que uiqero conseguir... el OBJETIVO
    Me centro en los pasos que felipe (mi computadora) debe hacer para conseguir ese objetivo
    
    ---
    
    Felipe, debajo de la ventana tiene que haber una silla. Y ES. TU RESPONSABILIDAD !
            OBJETIVO
    Delego la creación del PLAN DE EJECUCION para conseguir el objetivo... que además dependerá del ESTADO INICIAL del sistema.
    
Eso es lo que me da el lenguaje declarativo = GENIAL !
En Ansible por ejemplo es lo que usamos.
    Asegurate que /tmp/micarpeta existe en la máquina.
En un script de la bash:
    crea /tmp/micarpeta en mi máquina: mkdir /tmp/micarpeta

---

En el caso de terraform, lo que haremos es DECLARAR en un fichero, la infra que QUIERO tener. = LENGUAJE DECLARATIVO

Por eso decimos que tenemos infraestructura como código.

Un script de terraform es una carpeta, llena de archivos .tf (que se escriben con sintaxis HCL)
Dentro de HCL se definen:
- terraform         Declara los proveedores con los que vamos a trabajar
- provider          Configura parametros de ese proveedor (que el proveedor necesita)
- resource          Un recurso que quiero gestionar en un proveedor
- variable          Parametros/Argeumento del script
                        $1 $2 $3
- output            Salidas del script
- data              Queries (consultas) que puedo hacer al proveedor
- module **
- locals **         Variables de mi script


# Proveedor en terraform

AWS o Azure no son un PROVEEDOR desde el punto de vista de terraform.

Para terraform, un proveedor es un programa que instalo en local y que se integra con terraform 
(terraform le pide cosas... a ese programa): terraform/aws provider
                                             terraform/azure provider
                                             nutanix/nutanix provider
                                             
    script -> terraform -> provider ->  ? 
                                        cloud
                                        nutanix
                                        kubernetes
                                        docker