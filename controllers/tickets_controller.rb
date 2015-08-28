class TicketsController < ApplicationController

  get '/' do
    @servers = Server.all
    erb :'tickets/servers'
  end

  post '/' do
    server = Server.find(params[:server_id])
    redirect "tickets/server/#{server.id}"
  end

  get '/server/:id' do
    @server = Server.find(params[:id])
    erb :'tickets/server_show'
  end

  post '/party' do
    party = Party.find(params[:party_id])
    Party.where(id: "#{party.id}").update_all(status: "open")
    redirect "/tickets/party/#{party.id}"
  end

  get '/party/:id' do
    @foods_Drinks = Food.all.where("course='Drinks'")
    @foods_Appetizers = Food.all.where("course = 'Appetizers'")
    @foods_Entrees = Food.all.where("course = 'Entrees'")
    @foods_Desserts = Food.all.where("course = 'Dessers'")
    @foods_Sides = Food.all.where("course = 'Sides'")
    @courses = ["Drinks", "Sides", "Appetizers", "Entrees", "Desserts"];
    @allergens = ["none", "lactose", "nuts", "wheat", "eggs", "soy", "fish"];
    @party = Party.find(params[:id])
    @item_orders = @party.item_orders
    @total = Party.calculate_receipt(@item_orders)
    erb :'tickets/new'
  end

  post '/party/:id' do
    id = params[:id]
    item_order = ItemOrder.create(params[:item_order])
    redirect "/tickets/party/#{id}"
  end

  post '/checkout/:id' do
    party = Party.find(params[:id])
    Party.where(id: "#{party.id}").update_all(status: "closed")
    redirect "/tickets/checkout/#{party.id}"
  end

  get "/checkout/:id" do
    @party = Party.find(params[:id])
    @orders = @party.item_orders.all
    @total = Party.calculate_receipt(@orders)
    erb :'tickets/receipt'
  end

  delete '/:id' do
    item = ItemOrder.find(params[:id])
    party = item.party
    ItemOrder.delete(params[:id])
    redirect "/tickets/party/#{party.id}"
  end

  get '/kitchen' do
    item_orders = ItemOrder.all.where("status = '0'")
    @orders= item_orders.order(:created_at)
    erb :'tickets/orders'
  end

  post '/kitchen/:id' do
    item_order = ItemOrder.find(params[:id])
    item_order.update({
      food_id: "#{item_order.food_id}",
      party_id: "#{item_order.party_id}",
      server_id: "#{item_order.server_id}",
      status: "delivered"
    })
    redirect '/tickets/kitchen'
  end
end
