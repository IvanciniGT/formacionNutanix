

1 kilobyte son 1000 bytes
1 megabyte son 1000 kilobytes
1 gigabyte son 1000 megabytes

Antiguamente (hace más de 20 años) no era asi:
1 kilobyte son 1024 bytes
1 megabyte son 1024 kilobytes
1 gigabyte son 1024 megabytes

Lo que antiguamente eran kilobytes hoy en dia se ha rebautizado como kibibytes kib
Lo que antiguamente eran megabytes hoy en dia se ha rebautizado como mebibytes kib
Lo que antiguamente eran gigabytes hoy en dia se ha rebautizado como gibibytes kib


No tengo ni idea cuando hago un script de este tip, cuando se va a llamar.
Al llamar a un script varias veces, ya vimos ayer que si algo está hecho... no se rehace
-> Estos scripts que tienen IDEMPOTENCIA se usan no solo para crear/desmantelar entornos.. Sino incluso para comprobarlos (monitorización) o curarlos/sanarlos.

Yo podría configurar un sistema que cada 5 minutos ejecute el script.
O... podría montar un sistema que haga ping . Si falla -> Script de terrafor + Script ansible...!

---

TLS+SSL:  Nos ayudan a frustrar 2 tipos de ataques:
- Suplantación de identidad < Firma del certificado por una entidad certificadora de confianza.
- Man in the middle < Encriptación: 
                        El grueso de la comunicación se hace mediante encriptación simetrica.   
