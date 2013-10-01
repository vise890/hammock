# where everything is setup
require './config/environment'

# don't run server when app is loaded
set :run, false

set :raise_errors, true

run Sinatra::Application
