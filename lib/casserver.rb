require 'rubygems'

require 'bundler'
require 'bundler/setup'
Bundler.require(:default)

module CASServer; end

$: << File.expand_path(File.dirname(__FILE__) + '/casserver')

require 'logger'
$LOG = Logger.new(STDOUT)

require 'server'
