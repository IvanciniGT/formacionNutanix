Nutanix
    Cluster C- Conjunto de Máquina físicas:
        AOS + hipervisor (AHV) + Element Prism
            Máquinas virtuales, volumenes, registrar imágenes...
    
    Prism Central   ---> Prism Element Cluster1
                    ---> Prism Element Cluster2
                    

MyNutanix
    NC2 - Nos permite montar cluster de Nutanix en clouds publicos.
    
    Prism Central   ---> Prism Element Cluster1         \
                    ---> Prism Element Cluster2 - AWS   / Cloud hibrido  \
                    ---> Prism Element Cluster3 - GCP                    / MultiCloud hibrido 
    
    Prism Central tiene más funcionalidad que prism element
    
    
    
OnPrem
    Cluster 1 + Prism Element.  <<<+
        Maquinas...                |
    Cluster 2 + Prism Element.  <<<+
        Maquinas...                |
    Cluster 3 + Prism Element   + Prism Central
        Maquinas...                |
Cluster 4 AWS + Prism Element.  <<<+
        Maquinas...                

Cloud Nutanix
        Nutanix Central --> Cluster 1
                            Cluster 2
                            Cluster 3
                            Cluster 4
                            
Nutanix central es la nueva generación de Prism Central

---

Cluster AWS
    Maquinas            - Red la gestiona AWS

Cluster OnPrem
    Máquinas            - Red Nutanix - Red de mi empresa > Internet        <     Clientes
                                        Balanceador    Proxy reverso
        VM1
        
JENKINS
    terraform > nutanix > terraform