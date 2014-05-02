# encoding: utf-8
name             'tkdevenv'
maintainer       'Darron Froese'
maintainer_email 'darron@froese.org'
license          'Apache 2.0'
description      'Installs/configures tkdevenv'
version          '0.1.0'
recipe           'tkdevenv::default', 'Installs/configures tkdevenv'

depends 'chef-sugar'
