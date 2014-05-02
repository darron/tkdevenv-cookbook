# encoding: utf-8
name             'tkdevenv'
maintainer       'Darron Froese'
maintainer_email 'darron@froese.org'
license          'Apache 2.0'
description      'Installs/configures a TestKitchen development environment for Digital Ocean.'
version          '0.1.0'
recipe           'tkdevenv::default', 'Installs/configures a TestKitchen development environment for Digital Ocean.'

depends 'chef-sugar'
depends 'ubuntu_base'
depends 'ruby2'
depends 'docker'
