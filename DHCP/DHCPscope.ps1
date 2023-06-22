#--- Scope configuration ---# 
Add-DhcpServerv4Scope -StartRange 192.168.12.10 -EndRange 192.168.1.254 -SubnetMask 255.255.255.0 -Name UsersDHCP -LeaseDuration 8.00:00:00

#--- Options configuration ---#
Set-DhcpServerv4OptionValue -ScopeId 192.168.1.0 -DnsServer 192.168.1.2 -Router 192.168.11.1 -DnsDomain 'depat.local'
