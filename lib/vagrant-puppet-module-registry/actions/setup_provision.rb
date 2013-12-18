module VagrantPlugins
  module PuppetModuleRegistry
    class Action
      class SetupProvision
        def initialize(app, env)
          @app = app
          @env = env

          provisioner = @env[:global_config].vm.provisioners[0]
          @puppet_config = provisioner ? provisioner.config: nil
          @vagrant_git_commiter_details = '.VAGRANT_GIT_COMMITER_DETAILS'
        end

        # generate custom facts and add them to our puppet_config if available
        def generate_custom_facts()
          if @puppet_config
            facts = {}
            generate_git_commiter_facts(facts)
            facts.each_pair { |k, v| @env[:ui].success "Creating fact #{k} => #{v}" }
            @puppet_config.facter = @puppet_config.facter.merge(facts)
          end
        end

        def call(env)
          generate_custom_facts()
          @app.call(env)
        end

      end
    end
  end
end
