# Projet final de l'AEC en gestion de réseaux et sécurité des systèmes
## Propriétaires et administrateurs de système: De Pessemier Renaud et Patrizi Mauro
##### _Ce projet vise à tester les aptitudes et compétences acquises des candidats. Cela ne reflète pas nécessairement la manière la plus efficace ou la plus pratique de concevoir un réseau._

## **Diagramme réseau**
![Diagramme réseau](https://github.com/maptriz/depat/blob/main/network.png)
## **Contrôleur de domaine**
Windows Server 2019. Active Directory et serveur DNS interne. RODC disponible dans les succursales externes, répliquant les services AD et DNS internes.
#### Script: [Script Powershell pour la configuration des utilisateurs](AD/ADUsers.ps1)

## **DHCP**
Windows Server 2019. Serveur DHCP dédié aux utilisateurs du LAN.
#### Script: [Script Powershell pour la configuration DHCP](DHCP/DHCPscope.ps1)

## **Serveur de fichiers**
Windows Server 2019. Serveur de fichiers avec partages des répertoires pour chaque groupe de sécurité des utilisateurs.
#### Script: [Script Powershell pour la configuration des permissions](FileServer/SMB_Icacls.ps1)

## **Virtualisation**
ESXi 6.7. Hyperviseur avec un datastore VMFS utilisant le stockage SAN. VM configurées dans le serveur: Alma Linux 9 avec une image docker personnalisée (docker commit) à partir d'une image Ubuntu configurée pour répliquer le DNS interne. Image personnalisée utilisée avec un script pour ouvrir plusieurs conteneurs en cas de trafic élevé.
#### Script: [Script bash pour ouvrir les conteneurs docker](Virtualisation/ContainerScript.sh)

## **SAN**
Alma Linux 9. Deux cibles iSCSI en répliquation pour une haute disponibilité et utilisant une adresse IP virtuelle. Réplication configurée avec drbd utilisant un RAID5 /dev/md0 et haute disponibilité configurée avec pacemaker et corosync (modules ocf_heartbeat_IPaddr2, ocf_heartbeat_iSCSITarget and  ocf_heartbeat_iSCSILogicalUnit)
#### Fichiers de configuration: [/etc/target/saveconfig.json](SAN/targetcli.json), [/etc/drbd.d/drbd1.res](SAN/drbd1.res)

## **Surveillance**
Alma Linux 9. Nagios Core pour surveiller le contrôleur de domaine et le DNS externe.
#### Fichiers de configuration: (/usr/local/nagios/etc/config_depat) [hôtes](Nagios/hosts.cfg), [commandes](Nagios/commands.cfg), [services](Nagios/services.cfg), [contacts](Nagios/contacts.cfg), [periodes](Nagios/periods.cfg), [/usr/local/nagios/etc/nagios.cfg](Nagios/nagios.cfg)

## **Automatisation**
Alma Linux 9 Minimal. Configuration automatique du serveur Web avec Ansible.
#### Configuration files: (/etc/ansible/) [ansible.cfg](Ansible/ansible.cfg), [hôtes](Ansible/hosts), [playbook](Ansible/web-playbook.yaml)

## **Serveur web**
Debian 11. Serveur Web Apache, configuré avec Ansible. Hébergé dans une DMZ.
#### Fichiers de configuration: Voir "Automatisation"; coniguré avec Ansible.

## **Serveur DNS (Externe)**
Alma Linux 9. Serveur Bind DNS externe. Hébergé dans une DMZ.
#### Fichiers de configuration: [/etc/named.conf](Bind/named.conf), [/var/named/depat.com](Bind/depat.com), [/var/named/db.192.168.11](Bind/db.192.168.11)

## **Router/Pare-feu**
Pfsense 2.6.0. Pare-feu, passerelle par défaut et VPN vers 3 autres succursales externes.
#### Configuration files: [[Fichier XML de configuration Pfsense](PfSense/config-pfSense.depat.local-20230622164741.xml)
