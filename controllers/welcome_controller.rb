class WelcomeController < ApplicationController

  get '/' do
    erb :index
  end

  get '/admin' do
    erb :admin
  end

end
