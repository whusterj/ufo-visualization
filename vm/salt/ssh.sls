add-authorized-keys:
  ssh_auth:
    - present
    - user: vagrant
    - source: salt://config/ssh/william.pub
