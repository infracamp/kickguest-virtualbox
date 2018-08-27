# Kickstart VirtualBox Image

The simplest way to run docker and kickstart on windows 8/10 and macOS.

- [Install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Download latest release](https://github.com/infracamp/kickguest-virtualbox/releases)

## Configuration

First: Create a host-only virtual network adaptor to run with the IP Address `10.127.127.127` (this ip
is associated with `local.infracamp.org` and `*.local.infracamp.org`):

*Hint: Of course, you can associate any other ip - but you than have to associate a hostname by yourself*

![settings1](doc/glob-settings-network1.png)
![settings2](doc/glob-settings-network2.png)

Then, connect the virtual maschine with this and the NAT bridge. 

![setting1](doc/settings-network1.png)
![setting2](doc/settings-network2.png)

Map you *Projects* Path to a shared folder with name `kick_share`.

![setting3](doc/settings-shared1.png)


## Log into to the system

Infracamp offers a public dns-record `local.infracamp.org` to point to `10.127.127.127`:

```ssh user@local.infracamp.org```

Or, by browser

```local.infracamp.org```

## Run the image

The image will start and:

- Create a ssh private/public key pair in `sharedFolder/.ssh/` (if not already existing)

