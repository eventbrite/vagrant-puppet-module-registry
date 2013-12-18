begin
  require 'vagrant'
rescue LoadError
  abort 'vagrant-puppet-module-registry must be loaded in a Vagrant environment.'
end


module VagrantPlugins
  module PuppetModuleRegistry
    class Plugin < Vagrant.plugin('2')
      name 'vagrant-puppet-module-registry'
      description <<-DESC
A Vagrant plugin to manage multiple puppet module paths.
DESC

      # define configs
      config 'puppet_module_registry' do
        require_relative 'config'
        Config
      end

      # define hooks
      action_hook 'setup_provision', 'machine_action_up' do |hook|
        require_relative 'actions/setup_provision'
        hook.prepend(Action::SetupProvision)
      end
      action_hook 'setup_provision', 'machine_action_provision' do |hook|
        require_relative 'actions/setup_provision'
        hook.prepend(Action::SetupProvision)
      end
      action_hook 'setup_provision', 'machine_action_reload' do |hook|
        require_relative 'actions/setup_provision'
        hook.prepend(Action::SetupProvision)
      end

    end
  end
end
