require './models/food'

class FoodsController < ApplicationController

  get '/' do
    @foods_Drinks = Food.all.where("course='Drinks'")
    @foods_Appetizers = Food.all.where("course = 'Appetizers'")
    @foods_Entrees = Food.all.where("course = 'Entrees'")
    @foods_Desserts = Food.all.where("course = 'Desserts'")
    @foods_Sides = Food.all.where("course = 'Sides'")
    erb :'foods/index'
  end

  get '/menu-edit' do
    @foods_Drinks = Food.all.where("course='Drinks'")
    @foods_Appetizers = Food.all.where("course = 'Appetizers'")
    @foods_Entrees = Food.all.where("course = 'Entrees'")
    @foods_Desserts = Food.all.where("course = 'Desserts'")
    @foods_Sides = Food.all.where("course = 'Sides'")
    erb :'foods/menu-edit'
  end

  get '/new' do
    @courses = ["Drinks", "Sides", "Appetizers", "Entrees", "Desserts"];
    @allergens = ["none", "lactose", "nuts", "wheat", "eggs", "soy", "fish"];
    erb :'foods/new'
  end

  post '/' do
    Food.create(params[:food])
    redirect '/foods'
  end

  get '/:id' do
    @food = Food.find(params[:id])
    erb :'foods/show'
  end

  get '/:id/edit' do
    @food = Food.find(params[:id])
    @courses = ["Drinks", "Sides", "Appetizers", "Entrees", "Desserts"];
    @allergens = ["none", "lactose", "nuts", "wheat", "eggs", "soy", "fish"];
    erb :'foods/edit'
  end

  put '/:id' do
    food = Food.find(params[:id])
    food.update(params[:food])
    redirect "/foods/#{ food.id }"
  end

  delete '/:id' do
    Food.delete(params[:id])
    redirect '/foods'
  end

end
