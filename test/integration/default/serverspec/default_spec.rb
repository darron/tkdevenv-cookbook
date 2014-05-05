# encoding: utf-8
require 'spec_helper'

# Write integration tests with Serverspec - http://serverspec.org/
describe 'tkdevenv::default' do
  describe package('lxc-docker') do
    it { should be_installed }
  end

  describe service('docker') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(4243) do
    it { should be_listening }
  end

  describe package('ruby2.0') do
    it { should be_installed }
  end

  describe package('ruby2.0-dev') do
    it { should be_installed }
  end

  describe package('virtualbox-4.3') do
    it { should be_installed }
  end

  describe package('vagrant') do
    it { should be_installed }
  end
end
