require 'rubygems'

# Require all the gems in Gemfile
require 'bundler/setup'
Bundler.require(:default)

# Load MongoDB ORM
mongoid_yml = File.expand_path('mongoid.yml', File.dirname(__FILE__))
Mongoid.load!(mongoid_yml)

# Require all the models
Dir['./api/models/*.rb'].each { |model| require model }

# Require hammock
require_relative '../lib/hammock'
