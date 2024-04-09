# Cloud
- Servicios sin mediación humana / AUTOMATIZACION

# Clouds publicos

Conjunto de servicios (IaaS, PaaS, SaaS) que una empresa ofrece a través de Internet.
Ventajas:
- Bajo coste de entrada
- Pago por uso
- Facil escalado (en picos)

Problemas de los Cloud públicos:
- A la larga salen caros en ciertos escenarios
- Me ato a un cloud
- Según que servicios me salen más baratos en uno u otro cloud

Cloud publicos más usados: AWS, Azure, GCP, IBM...

# Nutanix

## Infraestructuras hiperconvergentes on premises:

- AOS
- Hipervisor: AHV (HyperV, VMWare)

Nos ofrecen servicios de: = Cloud privado (IaaS+PaaS)
- Máquinas virtuales (computo)
- Almacenamiento
- Red
+ BBDD
+ Kubernetes

Nutanix no es la única forma de montar un cloud privado: OpenStack

Los cloud privados necesitan de INFRA propia (son más baratos... si uso la infra)

## Clouds híbridos: Cloud privado + Cloud público

Problemas adicionales:
- Empiezo a tener que gestionar un montón de infras inconexas: Cloud privado + GCP + Azure

Nutanix nos echa una mano... nos ofrece una alternativa para resolver algunos problemas concretos.

## NC2: Nutanix Cloud Clusters

Lo que haces es montar el mismo tinglao que montaba en mis máquinas, pero ahora en las máquinas de un cloud publico.

AWS: 
    Dame 3 hierros
    
    De normal, AWS, me permite contratar VM... En sus hierros, monta su hipervisor... y AWS controla la gestión de VMs
    Cuanto trabajamos con NC2:
        En esas máquinas Nutanix monta AOS + AHV (sin excepción) + Prism
        Y ya el Cloud público (AWS...) deja de ofrecerme los servicios de: Almacenamiento, VM, Redes...
        Es nutanix.

Que conseguimos con esto:
- Tener una única herramienta para controlar todos los custers de máquinas, almacenamiento...de todos los clouds (publicos y privados) con los que trabaje.
- Acabamos de meter una capa de abstracción contra el cloud (virtualización del cloud):
    El día de mañana puedo cambiar de cloud... y que todo siga igual.

    AWS -> GCP
                3 máquinas... o 300
                AOS + AHV + PRISM... Lo que tenía en AWS, lo mueves al otro.

---

# Terraform: IaC
- HCL: lenguaje declarativo para definir Infra (más cosas... pero se usa principalmente para infra)
    Script es una carpeta con ficheros .tf: main, versions, variables, outputs...   
    Palabras:
        terraform   Declaro los proveedores que voy a usar          versions
        provider    Configuro esos proveedores (si hace falta)      versions
        resource    Declaro recursos que quiero gestionar (infra)   main
        output      Salidas: Datos que capturo de los recursos      outputs
        variable    Parametrización del script                      variables
        data        Queries al proveedor                            main
        local       Variables internas del script                   main
        module      ---                                             main

    script -> terraform -> provider -> Proveedor externo de recursos (normalmente de infra)
    Esos provider son programas que debemos instalar localmente... y hay tropecientos.
        >>> https://registry.terraform.io/browse/providers

- Interprete: comando terraform. Al interprete es al que le doy ORDENES !!!!
  Operaciones:
    init        Descargar los proveedores que definimos en el script (normalmente en el archivo versions)
    validate    Valida el script (la sintaxis)
    plan        Dame el plan de ejecución. Lo que vas a hacer para conseguir tener lo que quiero tener (lo que he declarado)
    apply       Aplicar el plan: EL PLAN DEPENDE DEL ESTADO ACTUAL DEL SISTEMA
                    Creará los recursos definidos
                    y/o Modificará recursos
                    y/o Borrará recursos
    destroy     Desmantelar infra (Esto es heavy)
    
Los lenguajes delcarativos me ofrecen IDEMPOTENCIA:
    Da igual el estado inicial de un sistema, siempre acabo en el mismo estado final

# Nginx

Nginx es un proyecto que surje como PROXY REVERSO
Con el tiempo gana funcionalidad de servidor weblogic

Al contrario que Apache httpd server, que sale como servidor weblogicY con el tiempo adquiere funcionalidad de proxy reverso

Nginx hoy en día es el proxy reverso y el servidor web más usado del mundo... pasó al apache hace ya 4/5 años.
    
    -------red de amazon----------------------------------
     |                                                  |
     172.31.35.6                                    172.31.35.200
     |  NAT :83 -> 172.17.0.2:80                        |
     IvanPC                                             MenchuPC
      |
      172.17.0.1
      |
      |- 172.17.0.2 - Contenedor de nginx: 80
      |
      red de docker
      
Terraform es solo una herramienta más de una cadena muy larga : DEVOPS:

Empiezo un proyecto de software nuevo en la empresa:


Eso lo necesito en x entornos:
- Desarrollo
    - Servidor de apps JAVA: Weblogic
    - BBDD MySQL (mirroring)
    - RABBITMQ
    - REDIS 
- Pruebas
    - Servidor de apps JAVA: Weblogic
    - BBDD MySQL (mirroring)
    - RABBITMQ
    - REDIS 
- PreProduccion
    - Servidor de apps JAVA: Weblogic x 2
    - Balanceador de carga x2 (activo pasivo) VIPA
    - BBDD MySQL (mirroring) + REPLICA
    - RABBITMQ x 3
    - REDIS x3
- Produccion
    - Servidor de apps JAVA: Weblogic x 4
    - Balanceador de carga x2 (activo pasivo) VIPA
    - BBDD MySQL (mirroring) + REPLICA
    - RABBITMQ x 3
    - REDIS x3
Y si ofrezco este producto como servicio a mis clientes... quizas tengo 17 entornos de producción

DEVOPS
Pipeline en Jenkins: NUEVO PROYECTO- Crear Entorno desarrollo
    1º Terraform - Proveer/Adquirir la infra
    2º Ansible   - Aprovisionar la infra (plancharla)

Pipeline de CI - Ejecutar pruebas previo paso a prod
    Pipeline en Jenkins: Crea entorno pre
        1º Terraform - Proveer/Adquirir la infra
        2º Ansible   - Aprovisionar la infra (plancharla)
    Pipeline: Ejecución de pruebas
        Que están automatizadas
    Pipeline en Jenkins: Destruir entorno pre
        1º Terraform - Desmantelar la infra

---
Los contenedores son una forma de distribuir e instalar software. Son la forma hoy en día!

## Modelo de instalación tradicional

        App1   App2   App3          Problemas:
    --------------------------          - App1, App2 y App3 tienen dependencias/configuraciones SO incompatibles
        Sistema Operativo               - Seguridad: App1 potencialmente puede acceder a los datos de App2
    --------------------------          - App1 (100% CPU) ->    App1            OFFLINE
             HIERRO                                             App2 y App3     OFFLINE


## Modelo de instalación basado en VM

        App1    | App2 + App3       Problemas:   
    --------------------------          - Configuración más compleja
        SO 1    |   SO 2                - Mnto más complejo
    --------------------------          - Merma en el rendimiento de las apps.
        VM 1    |   VM 2                - Perdida de recursos
    --------------------------      
        Hipervisor: VMWare
        HyperV, KVM, Citrix, 
        VirtualBox
    --------------------------      
        Sistema Operativo           
    --------------------------      
             HIERRO                 

## Modelo de instalación basado en Contenedores

        App1    | App2 + App3   
    --------------------------  
        C 1     |   C 2         
    --------------------------      
      Gestor de contenedores:
      docker, podman, crio, 
      containerd
    --------------------------      
      Sistema Operativo LINUX          
    --------------------------      
             HIERRO                 

Kubernetes(K3S, K8S, minikube, minishift, OKD, Openshift, Tamzu)
    HIERRO1
        crio/containerd
    HIERRO2
        kubelet
        kubeadm
        crio/containerd
        contenedor1-nginx
    HIERRO3
        crio/containerd

# Kubernetes/Openshift/Tamzu

Gestores de gestores de contenedores
+ que me dan todo lo que necesito para un entorno de producción
     Balanceador de carga           SERVICE
     Proxy reverso                  INGRESS CONTROLLER
     Regras de firewall de red      NETWORK POLICIES


Openshift = Kubernetes + Añadidos de redhat
    Capacidad de solicitar máquinas que añadir al cluster. cuando necesite más capacidad de cómputo
        Redhat: AWS, IBM, AZURE
            Monta unos scripts de terraform para contratar máquinas o descontratarlas en esos clouds en auto.
            Monta unos playbooks de ansible para planchar esas máquinas (paquetería)
            Programa que monitoriza los recursos de los nodos y lanza esos scripts a conveniencia
            
Tamzu = Kubernetes + Añadidos de VMWare

Karbon Nutanix Kubernetes = Kubernetes + añadidos de nutanix

    UPSTREAM

    Gratuita y opensource           Opensource y de pago     Opensource y gratis (sin mnto/soporte)
    Fedora                    ----> RHEL                ---> CentOS
    Novedades
    
    Wildfly                         JBoss
    AWX                             Ansible Tower
    OKD                             Openshift Container platform
    
    
    
    
    
    app1*   <<<
    |
    app2    <<<
    x
    app3    <<<
    
        BRAIN SPLITTING
    
    Todas las herramientas que guardan datos: BBDD, Indexadores, Caches, Mensajería
    
    
---

# Terraform 
                                        fichero tfstate
    Estado deseado  ----> plan ----> Estado que Terraform conoce < -- refresh ---  Estado real (en backend)
                    ----------------> apply ------------------------------------->
                    
## Variables

Una vez definidas, en tiempo de ejecución puedo darle valores:

- Suministrarla en el comando con --var  NOMBRE_VARIABLE=VALOR
- Suministrarla en un fichero al comando con --var-file FICHERO
- Si no le digo nada, me la pide por pantalla
