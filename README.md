# **depat**
# Projet final de l'AEC en gestion de réseaux et sécurité des systèmes
##### _This project is meant to test the acquired skills and competences of the candidates. It doesn't necessarily reflect the most efficient or practical way of designing a network._

## **Domain Controller**
Windows Server 2019. Active Directory and internal DNS server. RODC available in the external branches, replicating AD and internal DNS services.
#### Configuration files: ADUsers.ps1

## **DHCP**
Windows Server 2019. DHCP Server dedicated for the LAN Users.
#### Configuration files:

## **File Server**
Windows Server 2019. File Sharing Server to share a directory to each users' security group.
#### Configuration files:

E:\Partage>icacls *
Achats DEPAT\Admins du domaine:(OI)(CI)(F)
       BUILTIN\Administrateurs:(OI)(CI)(F)
       DEPAT\Achats:(OI)(CI)(F)

Centre d'appel DEPAT\Admins du domaine:(OI)(CI)(F)
               DEPAT\Centre d'appel:(OI)(CI)(F)
               BUILTIN\Administrateurs:(F)

Comptabilité BUILTIN\Administrateurs:(F)
             DEPAT\Admins du domaine:(OI)(CI)(F)
             DEPAT\Comptabilité:(OI)(CI)(F)

Finance BUILTIN\Administrateurs:(F)
        DEPAT\Admins du domaine:(OI)(CI)(F)
        DEPAT\Finance:(OI)(CI)(F)

Informatique BUILTIN\Administrateurs:(F)
             DEPAT\Admins du domaine:(OI)(CI)(F)
             DEPAT\Informatique:(OI)(CI)(F)

Ingénierie BUILTIN\Administrateurs:(F)
           DEPAT\Admins du domaine:(OI)(CI)(F)
           DEPAT\Ingénierie:(OI)(CI)(F)

RH BUILTIN\Administrateurs:(F)
   DEPAT\Admins du domaine:(OI)(CI)(F)
   DEPAT\RH:(OI)(CI)(F)

Ventes DEPAT\Admins du domaine:(OI)(CI)(F)
       BUILTIN\Administrateurs:(OI)(CI)(F)
       DEPAT\Ventes:(OI)(CI)(F)

## **Virtualisation**
ESXi ???. Hypvervisor accessing the SAN storage. Hosting docker containers replicating the DNS server in case of high traffic.
#### Configuration files:

## **SAN**
Alma Linux 9???. Two iSCSI Targets replicating for high availability and using a virtual IP address.
#### Configuration files:

## **Monitoring**
Alma Linux 9. Nagios Core to monitor our Domain Controller and external DNS server.
#### Configuration files: 

## **Automatisation**
Alma Linux 9???. Automatic configuration of the Web Server with Ansible.
#### Configuration files:

## **Web Server**
Alma Linux 9???. Apache Web Server, configured with Ansible. Hosted in a DMZ.
#### Configuration files:

## **DNS Server (External)**
Alma Linux 9???. External DNS Server. Hosted in a DMZ.
#### Configuration files:

## **Router/Firewall**
Pfsense ???. Firewall, Default Gateway and VPN to 3 other external branches.
#### Configuration files:
