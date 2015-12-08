base:
    '*':
        - software.core_packages
        - software.remove_packages
        - users.admins
        - users.former_users
    '* and not *.infra.ring.nlnog.net':
        - users.ring_users
        - mine
