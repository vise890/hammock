require 'rubygems'

# Require all the gems in Gemfile
require 'bundler/setup'
Bundler.require(:default)

# Require all the models
Dir['./api/models/*.rb'].each { |model| require model }

# Require hammock
require_relative '../lib/hammock'
