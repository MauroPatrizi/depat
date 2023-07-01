# Final Project for the AEC "Network management and systems security"
## Owners and System Administrators: De Pessemier Renaud and Patrizi Mauro
##### _This project is meant to test the acquired skills and competences of the candidates. It doesn't necessarily reflect the most efficient or practical way of designing a network._

## **Domain Controller**
Windows Server 2019. Active Directory and internal DNS server. RODC available in the external branches, replicating AD and internal DNS services.
#### Script: [Powershell script for users configuration](AD/ADUsers.ps1)

## **DHCP**
Windows Server 2019. DHCP Server dedicated for the LAN Users.
#### Script: [Powershell script for DHCP configuration](DHCP/DHCPscope.ps1)

## **File Server**
Windows Server 2019. File Server with directory shares for each users' security group.
#### Scripts: [Powershell script for FileServer permissions](FileServer/SMB_Icacls.ps1)

## **Virtualisation**
ESXi 6.7. Hypvervisor accessing the SAN storage. Hosting docker containers replicating the internal DNS server in case of high traffic.
#### Configuration files:

## **SAN**
Alma Linux 9. Two iSCSI Targets replicating for high availability and using a virtual IP address. Replication configured with drbd using a RAID5 /dev/md0 and high availability configured with pacemaker and corosync (modules ocf_heartbeat_IPaddr2, ocf_heartbeat_iSCSITarget and  ocf_heartbeat_iSCSILogicalUnit)
#### Configuration files: [/etc/target/saveconfig.json](SAN/targetcli.json) [/etc/drbd.d/drbd1.res](SAN/drbd1.res)

## **Monitoring**
Alma Linux 9. Nagios Core to monitor the Domain Controller and the external DNS server.
#### Configuration files: (/usr/local/nagios/etc/config_depat/) [hosts](Nagios/hosts.cfg), [commands](Nagios/commands.cfg), [services](Nagios/services.cfg), [contacts.cfg](Nagios/contacts.cfg), [periods.cfg](Nagios/periods.cfg), [/usr/local/nagios/etc/nagios.cfg](Nagios/nagios.cfg)

## **Automatisation**
Alma Linux 9 Minimal. Automatic configuration of the Web Server with Ansible.
#### Configuration files: (/etc/ansible/) [ansible.cfg](Ansible/ansible.cfg), [hosts](Ansible/hosts), [playbook](Ansible/web-playbook.yaml)

## **Web Server**
Debian 11. Apache Web Server, configured with Ansible. Hosted in a DMZ.
#### Configuration files: check "Automatisation"; configured with Ansible.

## **DNS Server (External)**
Alma Linux 9. External Bind DNS Server. Hosted in a DMZ.
#### Configuration files: [/etc/named.conf](Bind/named.conf), [/var/named/depat.com](Bind/depat.com), [/var/named/db.192.168.11](Bind/db.192.168.11)

## **Router/Firewall**
Pfsense 2.6.0. Firewall, Default Gateway and IPSEC VPN to 3 other external branches.
#### Configuration files: [PfSense XML configuration file](PfSense/config-pfSense.depat.local-20230622164741.xml)
