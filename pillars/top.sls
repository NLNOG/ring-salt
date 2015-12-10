base:
  # all nodes
  '*':
    - mine
    - openssh
    - software.core_packages
    - software.remove_packages
    - users.admins
    - users.former_users

  # all regular ring nodes
  'not *.infra.ring.nlnog.net':
    - users.ring_users
