require 'rake'

desc 'Start pry console with app environment loaded'
task 'console' do
  exec 'pry -r ./config/environment'
end

desc 'Seed database with some coconuts'
task 'db:seed' do
  require './seed'
end
