# Kickstart VirtualBox Image

The simplest way to run docker and kickstart on windows 8/10 and macOS.

- [Install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Download latest release](https://github.com/infracamp/kickguest-virtualbox/releases)

## Configuration

### Importing the virtual appliance

After downloading the `.ova`-image, import the virtual machine to your VirtualBox

![Import](doc/import-appliance1.png)




Second: Create a host-only virtual network adaptor to run with the IP Address `10.127.127.127` *(this private ip
is associated with `local.infracamp.org` and `*.local.infracamp.org`)*:

*Hint: Of course, you can associate any other ip - but you than have to associate a hostname by yourself*

![settings1](doc/glob-settings-network1.png)
![settings2](doc/glob-settings-network2.png)

> Please make sure to remove and create a new host-adapter when upgrading kickguest (dhcp issue in virtualbox)

### Configuring the virtual appliance

Open the `settings`-dialog of the newly created machine.

Ensure the machine is configured to `Ubuntu (64-bit)`

![General Settings](doc/settings-general1.png)

Then connect the virtual maschine both with the host **and** the NAT bridge. 

![setting1](doc/settings-network1.png)
![setting2](doc/settings-network2.png)

Finally map **YOUR** *Projects* Path to the shared folder name `kick_share`.

![setting3](doc/settings-shared1.png)

***Restart Windows!***

Start the virtual machine: 
![setting3](doc/settings-shared2-startvm.png)

## Log into to the system

```ssh user@local.infracamp.org``` or `ssh user@10.127.127.127`

Or in your browser (only from your local computer)

```http://local.infracamp.org``` (only when you run a http-based container)

## Run the image

The image will start and:

- Create a ssh private/public key pair in `sharedFolder/.ssh/` (if not already existing)


## FAQ / Debugging

- Try to ping 10.127.127.1 from inside container. If it fails, maybe you'll have to
  restart your computer. (Windows need restart for adapter-canges to take effect)
  
- Nothing is is `/mnt`: Is your shared-folder named `kick_share` and active?

- The machine won't boot:
    - Are virtualisation CPU features turned on in your bios?
      (VirtualBox will throw an exception)
    - Is machine vm-type set "Ubuntu" and version to "Ubuntu (64-bit)"?
      (Otherwise system will hang after grub bootloader)
