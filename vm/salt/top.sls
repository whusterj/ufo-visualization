base:
  'web*':
    - postgres
  '*':
    - requirements
    - directories
    - django
    - node
    - ssh
