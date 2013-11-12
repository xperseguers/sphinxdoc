# typo3sphinx.dev

This is a basic project to set up a TYPO3 website with Sphinx-Doc.

## Requirements

- Vagrant: http://docs.vagrantup.com/v2/installation/index.html
- VirtualBox: https://www.virtualbox.org/wiki/Downloads

## Install

Clone this repository locally:

    $ git clone --recursive https://github.com/xperseguers/sphinxdoc.git
    $ cd sphinxdoc
    $ vagrant up

Open ``/etc/hosts`` and add

    192.168.50.100  typo3sphinx.dev

Now open your browser and go to http://typo3sphinx.dev

### MySQL

* MySQL database: **typo3sphinx**
* MySQL username/password: **typo3sphinx** / **typo3sphinx**

phpMyAdmin is available on http://192.168.50.100/phpmyadmin/ (root / 123)

### SSH

To connect to your machine, do:

    $ vagrant ssh
