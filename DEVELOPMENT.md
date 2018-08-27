# How to develop this piece of software.

Download the free virtualbox runner and install
ubuntu server using the default image. Select `minimal virtual maschine`,
select `install ssh server`

- Create a user `user` with password `pass` (the password will be removed later)

- Hostname: `kickguest`

After installation login to the system.

- Edit `/etc/netplan/00-netplan.yml` and add `enp0s8` to `dhcp4: yes`. Safe - reboot.


## The provision script

Then, login to the image using ssh as user `ssh user@local.infracamp.org` and  run this script:



````
sudo apt-get update && sudo apt-get install -y git && cd /tmp/ && sudo git clone https://github.com/infracamp/kickguest-virtualbox.git && sudo bash /tmp/kickguest-virtualbox/provision/install.sh
````

(The Guste-Filesystem utils are hiddin in virtualbox-guest-utils )

Test the system - then

``
rm /home/user/.bash_history
sudo rm /root/.bash_history
``

## Descision about preinstalled packages

- Why do we need `whois`-Package?

The `mkpasswd`-script is located inside to create strong hashed
passwords. You'll need strongly hashed passwords everywhere in public
cloud infrastructure - so we'll make it easy to create hashes.

- What's about `open-vm-tools`?

This is used to mount the host filesystems into the container.
(Open Source version of VMwares TOOLS)