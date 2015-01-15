postgres:
  pg_hba.conf: salt://postgres/pg_hba.conf

  lookup:
    pkg: 'postgresql-9.3'
    pg_hba: '/etc/postgresql/9.3/main/pg_hba.conf'

  users:
    localUser:
      password: '98ruj923h4rf'
      createdb: False

    remoteUser:
      password: '98ruj923h4rf'
      createdb: False

  # This section cover this ACL management of the pg_hba.conf file.
  # <type>, <database>, <user>, [host], <method>
  acls:
    - ['local', 'db1', 'localUser']
    - ['host', 'db2', 'remoteUser', '123.123.0.0/24']

  databases:
    db1:
      owner: 'localUser'
      user: 'localUser'
      template: 'template0'
      lc_ctype: 'C.UTF-8'
      lc_collate: 'C.UTF-8'

    db2:
      owner: 'localUser'
      user: 'remoteUser'
      template: 'template0'
      lc_ctype: 'C.UTF-8'
      lc_collate: 'C.UTF-8'

  # This section will append your configuration to postgresql.conf.
  postgresconf: |
    listen_addresses = 'localhost,*'
