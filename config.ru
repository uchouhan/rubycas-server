require 'rubygems'
require 'bundler/setup'

require 'config/setup_load_paths'

$: << "#{File.dirname(__FILE__)}/lib"
require "casserver"

use Rack::ShowExceptions
use Rack::Runtime
use Rack::CommonLogger

run CASServer::Server.new
