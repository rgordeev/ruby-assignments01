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