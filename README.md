# Prepare work environment

## Installing VirtualBox

VirtualBox [https://www.virtualbox.org/](https://www.virtualbox.org/) is an open source tool sponsored by Oracle, which lets you create, manage, and use virtual machines on your own computer.

VirtualBox is a graphical program, which lets you visually create virtual machines, allocate resources, load external media such as operating system CDs, and view the screen of the virtual machine. Vagrant wraps on top of this and provides an intuitive command-line interface along with integration of additional tools (including provisioners such as Puppet and Chef), so that we don't need to worry about how VirtualBox works or what to do with it; Vagrant takes care of it for us.

The first stage is to download the installer from the VirtualBox downloads page [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads). We need to select the download, which relates to our computer (OS X, Windows, Linux, or Solaris).

Once downloaded, let's open it up and run the installer. On OS X, this involves clicking on the VirtualBox.pkg icon that is shown on the screen. On Windows, simply opening the installer opens the installation wizard.

Before the installer runs, it first checks to see if the computer is capable of having VirtualBox installed we need to click on Continue to begin the installation process. While this process will vary from OS X to Windows to Linux, the process is very similar across all platforms. There are fully detailed installation instructions for all platforms on the VirtualBox website [https://www.virtualbox.org/manual/ ch02.html)](https://www.virtualbox.org/manual/ch02.html).

## Installing Vagrant

Now that we have the prerequisites installed on our computer, we can actually install Vagrant itself. This process is similar to that of installing VirtualBox. First, let's download the relevant installer from the Vagrant page [http://downloads. vagrantup.com/tags/v1.2.2](http://downloads. vagrantup.com/tags/v1.2.2).

Let's open up the installer and start the process. Again, on OS X, the first step is to double-click on the Vagrant.pkg icon.

We now need to follow the installation steps which are provided; this is very similar to the earlier steps for VirtualBox, and for most of the software packages in general.

Let's verify if Vagrant has been successfully installed, by opening a command prompt (terminal on Linux/OS X or cmd on Windows) and running Vagrant.
```shell
vagrant
```

The preceding output shows that we have successfully installed Vagrant, and that we are able to run it.

## Using Vagrant for virtualization

### Creating Vagrant projects

Provided we are in the directory we wish to convert into a new Vagrant project, we can simply run the following command at the terminal:
```shell
vagrant init precise64 http://files.vagrantup.com/precise64.box
```
This runs the init subcommand within Vagrant, and instructs Vagrant to create a new project with configuration to use the box named precise64, and if the box is not found, to import the box located at [http://files.vagrantup.com/precise64.box](http://files.vagrantup.com/precise64.box) when the Vagrant environment is booted for the first time. The name precise64 can be used within other new and existing projects to refer to this base box. Base boxes are downloaded and stored in a place Vagrant can access and reuse.

Or you may use other prepared boxes from [https://atlas.hashicorp.com/boxes/search](https://atlas.hashicorp.com/boxes/search), e.g.
```shell
vagrant init ubuntu/trusty64
```

The initialization of the new project creates a file named Vagrantfile within our project's folder. When we go to boot a Vagrant virtual environment, Vagrant looks for this configuration file to determine what to do. Because everything related to the Vagrant environment is either within this file or the provisioning (SSH, Puppet, and Chef) files within our project, it's easy to maintain the environment under version control and share it with colleagues.

### Controlling guest machines

Now that we have a project initialized, we need to be able to control our guest machine. At the moment, all we have is a Vagrantfile file, which defines the configuration for the project.

#### Powering up the virtual machine

We can power up the virtual machine using the 
```shell
vagrant up 
```
command.

#### Suspending the virtual machine

We can save the current state of the virtual machine to disk so that we can resume it later. If we run vagrant suspend, it will suspend the VM and stop it from consuming our machine's resources (except for the disk space it will occupy), ready for us to resume later:

```shell
vagrant suspend
```

#### Resuming the virtual machine

In order to resume a previously suspended virtual machine, we simply run 
```shell
vagrant resume
```

#### Shutting down the virtual machine

We can shut down a running virtual machine using the 
```shell
vagrant halt 
```
command. This instructs the VM to stop all running processes and shut down. To use it again, we need to run `vagrant up`, which will power on the machine; by default, the `up` command will re-run any provisioning tools we have set up.

#### Starting from scratch

Sometimes, things go wrong. It's not inconceivable that we might make some changes to our virtual machine and find out that it no longer works. Thankfully, since we have a base box, configuration file, and provisioning files, which are all stored separately, we can instruct Vagrant to destroy our virtual machine, and then create it again, using the configurations to set it up. This is done via the destroy subcommand, and then the up subcommand to start it again:

```shell
vagrant destroy
vagrant up
```

Of course, if we update our Vagrantfile, provisioning manifests, or application code that can also break things; so it is important we use a Version Control System to properly manage our project's code and configuration so we can undo changes there to; Vagrant can only do so much to help us!

#### Connecting to the virtual machine over SSH

If we run the 
```shell
vagrant ssh
```
command, Vagrant will then connect to the VM over SSH. Alternatively, we could use SSH to connect to localhost with port 2222, and this will tunnel into the VM.

After we have run Ubuntu on Vagrant and connected to it via ssh, we are ready to...

# Install Ruby and Ruby on Rails with rbenv on Ubuntu

## Introduction

Ruby on Rails is an extremely popular open-source web framework that provides a great way to write web applications with Ruby.

This tutorial will show you how to install Ruby on Rails on Ubuntu, using rbenv. This will provide you with a solid environment for developing your Ruby on Rails applications. rbenv provides an easy way to install and manage various versions of Ruby, and it is simpler and less intrusive than RVM. This will help you ensure that the Ruby version you are developing against matches your production environment.

# Install rbenv
Let's install rbenv, which we will use to install and manage our Ruby installation.

First, update apt-get:
```shell
sudo apt-get update
```
Install the rbenv and Ruby dependencies with apt-get:
```shell
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
```
Now we are ready to install rbenv. The easiest way to do that is to run these commands, as the user that will be using Ruby:
```shell
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
```
Note: On Ubuntu Desktop, replace all occurrences .bash_profile in the above code block with .bashrc.

This installs rbenv into your home directory, and sets the appropriate environment variables that will allow rbenv to the active version of Ruby.

Now we're ready to install Ruby.

## Install Ruby

Before using rbenv, determine which version of Ruby that you want to install. We will install 
the latest version, at the time of this writing, Ruby 2.2.3. You can look up the latest 
version of Ruby by going to the [Ruby Downloads page](https://www.ruby-lang.org/en/downloads/).

As the user that will be using Ruby, install it with these commands:
```shell
rbenv install -v 2.2.3
rbenv global 2.2.3
```
The `global` sub-command sets the default version of Ruby that all of your shells will use. If you want to install and use a different version, simply run the rbenv commands with a different version number.

Verify that Ruby was installed properly with this command:
```shell
ruby -v
```

It is likely that you will not want Rubygems to generate local documentation for each gem that you install, as this process can be lengthy. To disable this, run this command:
```shell
echo "gem: --no-document" > ~/.gemrc
```

You will also want to install the bundler gem, to manage your application dependencies:
```shell
gem install bundler
```
Now that Ruby is installed, let's install Rails.

## Install Rails

As the same user, install Rails with this command (you may specify a specific version with the -v option):
```shell
gem install rails
```

Whenever you install a new version of Ruby or a gem that provides commands, 
you should run the `rehash` sub-command. This will install shims for all 
Ruby executables known to rbenv, which will allow you to use the executables:
```shell
rbenv rehash
```

Verify that Rails has been installed properly by printing its version, with this command:
```shell
rails -v
```

If it installed properly, you will see the version of Rails that was installed.

## Summary

In summuary all you have to do for prepearing your working environment is to pass through a few simple steps:

1. Install VirtualBox
2. Install Vagrant
3. Execute following commands in your terminal
  ```shell
  vagrant init ubuntu/trusty64
  vagrant up
  vagrant ssh # here you are connecting to the virtual machine
  sudo apt-get update
  sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
  cd ~
  git clone git://github.com/sstephenson/rbenv.git .rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
  echo 'eval "$(rbenv init -)"' >> ~/.bash_profil
  git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
  source ~/.bash_profile
  rbenv install -v 2.2.5
  rbenv global 2.2.5
  ruby -v # check ruby version
  echo "gem: --no-document" > ~/.gemrc
  gem install bundler
  gem install rails
  rbenv rehash
  rails -v # check rails version
  ```
