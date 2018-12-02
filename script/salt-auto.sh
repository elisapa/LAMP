sudo add-apt-repository universe
sudo apt-get update

sudo apt-get install -y salt-master salt-minion
echo -e 'master: 192.168.43.143\nid: test-minion'|sudo tee /etc/salt/minion
sudo systemctl restart salt-minion

sleep 5

sudo salt-key -Ay

