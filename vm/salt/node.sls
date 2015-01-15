install_node:
  cmd.run: 
    - user: vagrant 
    - name: ". ../.virtualenvs/ufo/bin/activate && nodeenv -p"
    - cwd: /home/vagrant/ufo/
    - require:
      - virtualenv: /home/vagrant/.virtualenvs/ufo
      - pkg: curl

setup_grunt:
  cmd.run: 
    - user: vagrant 
    - name: ". ../.virtualenvs/ufo/bin/activate && sudo npm config set unicode=false && sudo npm install -g grunt-cli && sudo npm install --no-bin-links"
    - cwd: /home/vagrant/ufo/
    - require:
      - virtualenv: /home/vagrant/.virtualenvs/ufo
