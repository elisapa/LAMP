installation:
  pkg.installed:
    - pkgs:
      - apache2
      - mysql-server
      - mysql-client
      - php7.0
      - libapache2-mod-php7.0
      - php7.0-mysql
      - httpie

/etc/apache2/mods-enabled/userdir.conf:
  file.symlink:
   - target: ../mods-available/userdir.conf

/etc/apache2/mods-enabled/userdir.load:
  file.symlink:
   - target: ../mods-available/userdir.load

apache2service:
 service.running:
   - name: apache2
   - watch:
     - file: /etc/apache2/mods-enabled/userdir.conf
     - file: /etc/apache2/mods-enabled/userdir.load

/tmp/commands.sql:
  file.managed:
    - mode: 600
    - source: salt://lamp-salt/commands.sql

'cat /tmp/commands.sql|sudo mysql -u root':
  cmd.run:
    - unless: "echo 'show databases'|sudo mysql -u root|grep '^lamp$'"
