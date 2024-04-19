Usuario

Role
    Es una Agrupación de permisos
    Por defecto en Prism Element tengo 3 roles.
    Con Prism Central o Terraform puedo crear más roles
        Para hacerlo, necesito saber qué permisos existen.

Permiso
    Son cada una de las operaciones atómicas que puedo hacer en nutanix.
    Los declara Nutanix... no yo.
    Yo puedo asignar permisos.
    
    
A los usuarios les asigno roles
    Usuario Admin x Role Admin
    Usuario Consulta x Role Viewer
    
En Prism Element, solo puedo asignar usuarios a roles.

En Prism Central y Mediante Terraform puedo asignar usuarios a roles mediante ACLs
    ACL: Listas de control de acceso
    El ACL me permite asignar un role a un usuario con condiciones (CONTROL DE ACCESO A OBJETOS)
    
    Usuario x Role (Pero limitado a unos objetos: TODOS, LOS SUYOS, O OBJETOS DISCRETOS [el objeto 33])
    
    
    
---
    Esto es en AWS                                                  En Nutanix

VPC : 10.0.0.0/16
    Management: 10.0.1.0/25 (la de los hosts físicos)                       
    Publica: Máquinas VM: 10.0.1.128/28                             red             10.0.1.136
    Subred2: Más máquinas: 10.0.2.0/24                              red2


Prism Central = VM -> 10.0.2.100                En una de las 4 máquinas físicas: 10.0.1.38, 39, 40, 41: EN CONCRETO EN LA 2: 10.0.1.38


    USUARIO
    vvvv    
    Balanceador
                        IP Privada -> Subnet
                        IP PUBLICA DE INTERNET: 99.80.105.156
                           DNS: central-44a944bf6725bd38.elb.eu-west-1.amazonaws.com
                           Responde en el puerto 9440
                            
                           Le tengo que abrir el puerto en el firewall de red de AMAZON
                                Security GROUP - 9440 - 0.0.0.0/0 La abriría solo para el PROXY DE EMPRESA , VPN
                        
    vvvvvvvvvv
        
    Máquina física (En red, le tengo que abrir el 9440 a la IP DEL BALANCEADOR y eso es otro security group)
      
      vvv
      
    VM-PC





        VM-PC
        10.0.2.100:9440
    -------------------------------
            AOS + AHV
    -------------------------------
        HIERRO FISICO: NAQUINA 2.  
            |
            eth0 - nic (2).   9440




Directory:
    LDAP = BBDD
    Nutanix lee los datos del LDAP (incluidos passwords y grupos)
        Es neesario hacer una vinculacion de los grupos del LDAP a los de nutanix

IDP
    SAML        Autenticacion
    OpenID      Autenticacion + Autorizacion





----

Nutanix Prism Central: 
    MarketPlace:
        Dar de alta apps que aumentan los servicios que puedo ofrecer en el cluster
            Karbon      -> Provisionar 1click clusters de kubernetes
                vm1 - nodo maestro de kubernetes(control - plane)
                vm2 - nodo maestro de kubernetes(control - plane)
                vm3 - nodo maestro de kubernetes(control - plane)
                
                worker1
                    contenedor1-mariadb SE CAE
                worker2
                    contenedor2-mariadb
                    contenedor2
            Database    -> Provisionar 1click bases de datos
                vm dentro de nutanix con Mariadb
                    Ubuntu + mariab
    
    En nutanix, si se cae una vm que se mueva a otro cluster
        Si se cae un cluster de kubernetes... o un nodo.. moverlo a otro cluster de nutanix

    
    En kubernetes puedes montar clusters FEDERADOS
        Por defecto nmo lo ofrece... se le pueden poner añadidos.
    
    
    
    
    
    
    

resource "nutanix_role" "nuevo-role" {
    name        = "MiRole"
    description = "Las personas con este rol solo podrán trabajar contra sus VM"
    permission_reference_list {
        kind = "permission"
        uuid = "ID OF PERMISSION"
    }
    permission_reference_list {
        kind = "permission"
        uuid = "ID OF PERMISSION"
    }
    permission_reference_list {
        kind = "permission"
        uuid = "ID OF PERMISSION"
    }
}



TERRAFORM
-----------
1º Dar de alta alguna imagen en prism central   
2º Dar de alta un nuevo rol
    Que pueda crear máquinas virtuales
3º Crear un usuario en LDAP con el rol de marras
3º Crear una máquina virtual en el cluster con la imagen nueva que hemos cargado    atacando a prism element / central

