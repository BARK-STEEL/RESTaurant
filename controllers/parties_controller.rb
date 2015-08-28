class PartiesController < ApplicationController

  get '/' do
    @parties = Party.all
    erb :'parties/index'
  end

  get '/date' do
    if params[:reservation_date].length > 0
      @formattedDate = Party.convert_time(params[:reservation_date])
      @date = params[:reservation_date]
      @parties = Party.all.where("reservation_date = '#{params[:reservation_date]}'")
    else
      @parties = []
    end
    erb :'parties/date'
  end

  post '/new/:date' do
    redirect "/parties/new/#{params[:date]}/#{params[:table_number]}"
  end

  get '/new/:date/:table_number' do
    @formattedDate = Party.convert_time(params[:date])
    @table_number = params[:table_number]
    @date = params[:date]
    @servers = Server.all
    erb :'parties/new'
    puts ************************************************
    puts params
  end

  post '/' do
    Party.create(params[:party])
    redirect '/parties'
  end

  delete '/:id' do
    Party.delete(params[:id])
    redirect '/parties'
  end

end
