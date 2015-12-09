### Information which we want to retrieve from each host and distribute to each host

# Have RING nodes publish their IP addresses towards each other
mine_functions:
  network.ip_addrs: []
  network.ip_addrs6: []
  grain.get:
    - fqdn_ip4
    - fqdn_ip6
