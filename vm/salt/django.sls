/home/vagrant/.virtualenvs/ufo:
  virtualenv.managed:
    - system_site_packages: True
    - user: vagrant
    - require:
      - pkg: python-dev
      - pkg: python-virtualenv

/home/vagrant/.bashrc:
  file.managed:
    - user: vagrant
    - group: vagrant
    - source: salt://config/bashrc

/home/vagrant/ufo/local_settings.yaml:
  file.managed:
    - user: vagrant
    - group: vagrant
    - source: salt://config/dev-config.yaml

add to python path:
  cmd.run:
    - user: vagrant
    - name: ". /etc/bash_completion.d/virtualenvwrapper && . ../.virtualenvs/ufo/bin/activate && add2virtualenv /home/vagrant/ufo"
    - cwd: /home/vagrant/uf
    - require:
      - virtualenv: /home/vagrant/.virtualenvs/ufo
      - pkg: python-dev
      - pkg: python-virtualenv
      - pkg: virtualenvwrapper

install Django requirements:
  cmd.run: 
    - user: vagrant 
    - name: ". ../.virtualenvs/ufo/bin/activate && ./requirements/install-requirements.sh"
    - cwd: /home/vagrant/ufo/
    - require:
      - virtualenv: /home/vagrant/.virtualenvs/ufo
      - pkg: python-dev
      - pkg: git-core

ufo_migrate:
  cmd.run: 
    - user: vagrant 
    - name: ". ../.virtualenvs/ufo/bin/activate && ./manage.py migrate"
    - cwd: /home/vagrant/ufo/
    - require:
      - virtualenv: /home/vagrant/.virtualenvs/ufo
      - pkg: python-dev

ufo_collectstatic:
  cmd.run: 
    - user: vagrant 
    - name: ". ../.virtualenvs/ufo/bin/activate && ./collectstatic.sh all"
    - cwd: /home/vagrant/ufo/
    - require:
      - virtualenv: /home/vagrant/.virtualenvs/ufo
      - pkg: python-dev
      - file: /home/vagrant/ufo/static-files