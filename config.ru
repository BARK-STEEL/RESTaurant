require 'bundler'
Bundler.require()

require './models/server'
require './models/food'
require './models/item_order'
require './models/party'

require './controllers/application_controller'
require './controllers/tickets_controller'
require './controllers/servers_controller'
require './controllers/foods_controller'
require './controllers/parties_controller'
require './controllers/welcome_controller'

map('/tickets'){ run TicketsController}
map('/servers'){ run ServersController}
map('/foods'){ run FoodsController}
map('/parties'){ run PartiesController}
map('/'){ run WelcomeController}
