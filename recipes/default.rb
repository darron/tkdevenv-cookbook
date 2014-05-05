# encoding: utf-8
#
# Cookbook Name:: tkdevenv
# Recipe:: default
#
# Copyright (C) 2014, Darron Froese <darron@froese.org>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

execute 'apt-get update' do
  command 'apt-get update'
end

include_recipe 'chef-sugar::default'

include_recipe 'ubuntu_base::default'

include_recipe 'ruby2::default'

include_recipe 'docker::default'

package 'libxml2-dev'
package 'libxslt1-dev'
package 'wget'

bash 'install current gems' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  wget https://raw.githubusercontent.com/darron/skeleton-cookbook/master/Gemfile
  bundle install
  EOH
end

bash 'install virtualbox' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  echo 'deb http://download.virtualbox.org/virtualbox/debian precise contrib' >> /etc/apt/sources.list
  wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
  apt-get update
  apt-get install -y virtualbox-4.3 dkms
  EOH
end

bash 'install vagrant' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.5.4_x86_64.deb
  dpkg -i vagrant_1.5.4_x86_64.deb
  EOH
end

bash 'setup git config' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  git config --global user.name "#{node['git']['name']}"
  git config --global user.email #{node['git']['email']}
  EOH
end
