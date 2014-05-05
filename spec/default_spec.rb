# encoding: utf-8
require 'spec_helper'

# Write unit tests with ChefSpec - https://github.com/sethvargo/chefspec#readme
describe 'tkdevenv::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'includes the `ruby2` recipe' do
    expect(chef_run).to include_recipe('ruby2::default')
  end

  it 'includes the `ubuntu_base` recipe' do
    expect(chef_run).to include_recipe('ubuntu_base::default')
  end

  it 'includes the `chef-sugar` recipe' do
    expect(chef_run).to include_recipe('chef-sugar::default')
  end

  it 'includes the `docker` recipe' do
    expect(chef_run).to include_recipe('docker::default')
  end

  it 'installs libxml2-dev' do
    expect(chef_run).to install_package('libxml2-dev')
  end

  it 'installs libxslt1-dev' do
    expect(chef_run).to install_package('libxslt1-dev')
  end

  it 'installs wget' do
    expect(chef_run).to install_package('wget')
  end
end
