class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    @pet = Pet.create(params[:pet])
    if !params["owner"].empty?
  @pet.owner = Owner.create(name: params["owner"])
end
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do
    #if !params[:pet].keys.include?("owner_ids")
    #  params[:pet]["owner_ids"] = []
    #  end
      #######

      @pet = Pet.find(params[:id])
      @pet.update(params["pet"])
      if !params["owner"].empty?
        @pet.owner= Owner.create(name: params["owner"])
      end
    redirect to "pets/#{@pet.id}"
  end
end
