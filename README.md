# Projet final de l'AEC en gestion de réseaux et sécurité des systèmes
## Owners: De Pessemier Renaud and Patrizi Mauro
##### _This project is meant to test the acquired skills and competences of the candidates. It doesn't necessarily reflect the most efficient or practical way of designing a network._

## **Domain Controller**
Windows Server 2019. Active Directory and internal DNS server. RODC available in the external branches, replicating AD and internal DNS services.
#### Configuration files and scripts: [ADUsers.ps1](ADUsers.ps1)

## **DHCP**
Windows Server 2019. DHCP Server dedicated for the LAN Users.
#### Configuration files:

## **File Server**
Windows Server 2019. File Sharing Server to share a directory to each users' security group.
#### Configuration files and scripts:

## **Virtualisation**
ESXi 6.7. Hypvervisor accessing the SAN storage. Hosting docker containers replicating the DNS server in case of high traffic.
#### Configuration files:

## **SAN**
Alma Linux 9. Two iSCSI Targets replicating for high availability and using a virtual IP address.
#### Configuration files: [targetcli.json](targetcli.json)

## **Monitoring**
Alma Linux 9. Nagios Core to monitor our Domain Controller and external DNS server.
#### Configuration files: (/usr/local/nagios/etc/config_depat) [hotes.cfg](hotes.cfg) [commands.cfg](commands.cfg) [services.cfg](services.cfg) [contacts.cfg](contacts.cfg) [periods.cfg](periods.cfg)

## **Automatisation**
Alma Linux 9 Minimal. Automatic configuration of the Web Server with Ansible.
#### Configuration files:

## **Web Server**
Debian 11. Apache Web Server, configured with Ansible. Hosted in a DMZ.
#### Configuration files:

## **DNS Server (External)**
Alma Linux 9. External DNS Server. Hosted in a DMZ.
#### Configuration files: [/etc/named.conf](named.conf] [/var/named/depat.com](depat.com)

## **Router/Firewall**
Pfsense 2.6.0. Firewall, Default Gateway and VPN to 3 other external branches.
#### Configuration files:
