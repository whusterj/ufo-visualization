/opt/ufo:
  file.symlink:
    - target: /home/vagrant/ufo

/home/vagrant/ufo/logs:
  file.directory:
    - user: vagrant
    - group: vagrant
    - recurse:
      - user
      - group

/home/vagrant/ufo/static-files:
  file.directory:
    - user: vagrant
    - group: vagrant
    - recurse:
      - user
      - group

/home/vagrant/ufo/media-files:
  file.directory:
    - user: vagrant
    - group: vagrant
    - recurse:
      - user
      - group