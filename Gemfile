source 'https://rubygems.org'

gemspec

group :development do
  gem 'vagrant', github: 'mitchellh/vagrant'
  gem 'debugger'
end

group :plugins do
  gem 'vagrant-puppet-fact-generator', :git => 'git@github.com:eventbrite/vagrant-puppet-fact-generator.git'
  gem 'vagrant-puppet-module-registry', path: '.'
end
