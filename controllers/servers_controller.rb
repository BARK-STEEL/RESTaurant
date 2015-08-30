class ServersController < ApplicationController

  get '/' do
    @servers = Server.all
    erb :'servers/index'
  end

  get '/new' do
    erb :'servers/new'
  end

  post '/' do
    server = Server.create(params[:server])
    redirect "/servers/#{server.id}"
  end

  get '/:id' do
    @server = Server.find(params[:id])
    @parties = @server.parties.all
    erb :'servers/show'
  end

  get '/:id/edit' do
    @server = Server.find(params[:id])
    erb :'servers/edit'
  end

  put '/:id' do
    server = Server.find(params[:id])
    server.update(params[:server])
    redirect "/servers/#{server.id}"
  end

  delete '/:id' do
    server=Server.find(params[:id])
    Party.delete_all("server_id=#{server.id}")
    ItemOrder.delete_all("server_id=#{server.id}")
    Server.delete(params[:id])
    redirect '/servers'
  end

end
