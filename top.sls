base:
    '*':
        - salt
        - core_software
        - users
        - openssh.known_hosts

    'coloclue01.ring.nlnog.net':
        - hostsfile
        - hostsfile.hostname
