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

- Interprete: comando terraform
  Operaciones:
    init        Descargar los proveedores
    validate
    plan
    apply
    destroy
    