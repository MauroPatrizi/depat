# Projet final de l'AEC en gestion de réseaux et sécurité des systèmes
## Propriétaires et administrateurs de système: De Pessemier Renaud et Patrizi Mauro
##### _Ce projet vise à tester les aptitudes et compétences acquises des candidats. Cela ne reflète pas nécessairement la manière la plus efficace ou la plus pratique de concevoir un réseau._

## **Contrôleur de domaine**
Windows Server 2019. Active Directory et serveur DNS interne. RODC disponible dans les succursales externes, répliquant les services AD et DNS internes.
#### Scripts et fichiers de configuration: [ADUsers.ps1](AD/ADUsers.ps1)

## **DHCP**
Windows Server 2019. Serveur DHCP dédié aux utilisateurs du LAN.
#### Fichiers de configuration:

## **File Server**
Windows Server 2019. Serveur de fichiers avec partages des répertoires pour chaque groupe de sécurité des utilisateurs.
#### Scripts et fichiers de configuration:

## **Virtualisation**
ESXi 6.7. Hypvervisor accédant au stockage SAN. Hébergement de conteneurs Docker répliquant le serveur DNS interne en cas de fort trafic.
#### Fichiers de configuration:

## **SAN**
Alma Linux 9. Deux cibles iSCSI en répliquation pour une haute disponibilité et utilisant une adresse IP virtuelle.
#### Fichiers de configuration: [targetcli.json](SAN/targetcli.json)

## **Monitoring**
Alma Linux 9. Nagios Core pour surveiller le contrôleur de domaine et le DNS externe.
#### Fichiers de configuration: (/usr/local/nagios/etc/config_depat) [hosts.cfg](Nagios/hosts.cfg) [commands.cfg](Nagios/commands.cfg) [services.cfg](Nagios/services.cfg) [contacts.cfg](Nagios/contacts.cfg) [periods.cfg](Nagios/periods.cfg) [/usr/local/nagios/etc/nagios.cfg](Nagios/nagios.cfg)

## **Automatisation**
Alma Linux 9 Minimal. Configuration automatique du serveur Web avec Ansible.
#### Configuration files: (/etc/ansible/) [ansible.cfg](Ansible/ansible.cfg) [hosts](Ansible/hosts) [web-playbook.yaml](Ansible/web-playbook.yaml)

## **Web Server**
Debian 11. Serveur Web Apache, configuré avec Ansible. Hébergé dans une DMZ.
#### Fichiers de configuration: Voir "Automatisation"; coniguré avec Ansible.

## **DNS Server (External)**
Alma Linux 9. Serveur Bind DNS externe. Hébergé dans une DMZ.
#### Fichiers de configuration: [/etc/named.conf](Bind/named.conf) [/var/named/depat.com](Bind/depat.com) [/var/named/db.192.168.11](Bind/db.192.168.11)

## **Router/Firewall**
Pfsense 2.6.0. Pare-feu, passerelle par défaut et VPN vers 3 autres succursales externes.
#### Fichiers de configuration:
