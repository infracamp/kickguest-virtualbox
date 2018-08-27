# Kickstart VirtualBox Image

The simplest way to run docker and kickstart on windows 8/10 and macOS.

- [Install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Download latest release](https://github.com/infracamp/kickguest-virtualbox/releases)

## Configuration

> You have to do these setup-steps only once! You will be able to start as many containers / projects as you want to

First: Create a host-only virtual network adaptor to run with the IP Address `10.127.127.127` *(this private ip
is associated with `local.infracamp.org` and `*.local.infracamp.org`)*:

*Hint: Of course, you can associate any other ip - but you than have to associate a hostname by yourself*

![settings1](doc/glob-settings-network1.png)
![settings2](doc/glob-settings-network2.png)

> Please make sure to remove and create a new host-adapter when upgrading kickguest (dhcp issue in virtualbox)

Then connect the virtual maschine both with the host **and** the NAT bridge. 

![setting1](doc/settings-network1.png)
![setting2](doc/settings-network2.png)

Finally map you *Projects* Path to the shared folder name `kick_share`.

![setting3](doc/settings-shared1.png)

***Restart virtualbox before you start your first virtual maschine!***

## Log into to the system

```ssh user@local.infracamp.org``` or `ssh user@10.127.127.127`

Or in your browser (only from your local computer)

```http://local.infracamp.org``` (only when you run a http-based container)

## Run the image

The image will start and:

- Create a ssh private/public key pair in `sharedFolder/.ssh/` (if not already existing)

