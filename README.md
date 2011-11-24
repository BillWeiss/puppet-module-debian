Puppet Debian Module
====================

Module for configuring Debian based systems.

Tested on Debian GNU/Linux 6.0 Squeeze and Ubuntu 10.4 LTS with
Puppet 2.6. Patches for other operating systems are welcome.


Installation
------------

Clone this repo to a debian directory under your Puppet modules directory:

    git clone git://github.com/uggedal/puppet-module-debian.git debian

If you don't have a Puppet Master you can create a manifest file
based on the notes below and run Puppet in stand-alone mode
providing the module directory you cloned this repo to:

    puppet apply --modulepath=modules test_debian.pp


Usage
-----

An alternative implementation can be added:


    debian::alternatives::add { "x-terminal-emulator":
      link => "/usr/bin/x-terminal-emulator",
      path => "/usr/bin/urxvtcd",
      priority => 20,
    }

And the alternative implementation can be selected:

    debian::alternatives::set { "x-terminal-emulator":
      path => "/usr/bin/urxvtcd",
    }
