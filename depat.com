$TTL 3H
@       IN SOA  @ admin.depat.local. (
                                        2       ; serial
                                        1D      ; refresh
                                        1H      ; retry
                                        1W      ; expire
                                        3H )    ; minimum

@	IN	NS	NS1
NS1	IN	A	192.168.11.5
www	IN	A	192.168.11.5
@	IN	A	192.168.11.5
