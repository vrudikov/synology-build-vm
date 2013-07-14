build VM for Synology disk station
==================================

Description
-----------

TODO

Requirements
------------

* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)

VirtualBox 4.2.14 has a bug that prevents imports of appliances and breaks Vagrant. Please use VirtualBox 4.2.16.

Installation
------------

Download and install VirtualBox and Vagrant.

Install librarian-chef Vagrant plugin:

The installation needs some essential build tools to be present (make, etc.). On Mac OS X, ff not already installed, the build tools come with Apple Xcode (optional Commandline tools).

```bash
$ vagrant plugin install vagrant-librarian-chef
```

Clone the repository:

```bash
$ git clone https://github.com/umesecke/synology-build-vm.git
$ cd synology-build-vm
```

Now fire up the VM:

```bash
$ vagrant up
```

Virtual Machine Management
--------------------------

suspend VM:

```bash
$ vagrant suspend
```

resume VM:

```bash
$ vagrant resume
```

destroy VM (removes the whole VM from the host system):

```bash
$ vagrant destroy
```