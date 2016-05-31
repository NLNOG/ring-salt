base:
  # all nodes
  '*':
    - mine
    - openssh
    - users.admins
    - users.former_users

  # all regular ring nodes
  'not *.infra.ring.nlnog.net':
    - users.ring_users
