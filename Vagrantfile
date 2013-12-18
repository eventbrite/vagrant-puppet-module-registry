#!/usr/bin/env ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_plugin 'vagrant-puppet-fact-generator'
Vagrant.require_plugin 'vagrant-puppet-module-registry'

Vagrant.configure('2') do |config|
  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  config.puppet_module_registry.register_module_path('core', 'manifests/modules')

  config.vm.provision 'puppet' do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.manifest_file = 'init.pp'
    puppet.module_path = config.puppet_module_registry.get_puppet_module_paths()
  end

end
