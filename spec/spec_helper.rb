require 'rubygems'

require 'bundler'
require 'bundler/setup'
Bundler.require(:default, :test)

require 'logger'
Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |file| require file }

set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

require 'capybara/node'
require 'capybara/dsl'

ENV['CONFIG_FILE'] = File.dirname(__FILE__) + '/support/configuration/default.yml'
load(File.dirname(__FILE__) + '/../lib/casserver/server.rb')
