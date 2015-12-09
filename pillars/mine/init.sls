### Information which we want to retrieve from each host and distribute to each host

# Have RING nodes publish their IP addresses towards each other
mine_functions:
  network.ip_addrs: []
  network.ip_addrs6: []:
    - cidr: 2000::/3
  fqdn_ip4:
    - mine_function: grains.get
    - fqdn_ip4
