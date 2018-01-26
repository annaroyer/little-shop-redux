class LittleShopApp < Sinatra::Base
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  get '/merchants/new' do
    erb :"merchants/new"
  end

  post '/merchants' do
    merchant = Merchant.create(params[:merchant])
    redirect :"merchants/#{merchant.id}"
  end

# Not Part of 7 Restful Paths
  post '/merchants/find' do
    merchant = Merchant.find_by(params[:merchants])
    redirect :"merchants/#{merchant.id}"
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/show"
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/edit"
  end

  put '/merchants/:id' do |id|
    Merchant.update(id.to_i, params[:merchant])
    redirect :"merchants/#{id}"
  end

  delete '/merchants/:id' do |id|
    Merchant.destroy(id.to_i)
    redirect :"merchants"
  end

  get '/categories' do 
    @categories = Category.all
    erb :"categories/index"
  end

  get '/categories/new' do
    erb :"categories/new"
  end

  get '/categories/:id' do
    @category = Category.find(params[:id])
    erb :"categories/show"
  end

  post '/categories' do 
    category = Category.create(params[:category])
    redirect :"categories"
  end

  get '/categories/:id/edit' do |id|
    @category = Category.find(params[:id])
    erb :"categories/edit"
  end

  put '/categories/:id' do |id|
    Category.update(id.to_i, params[:categories])
    redirect :"categories/#{id}"
  end

  delete '/categories/:id' do |id|
    Category.destroy(id.to_i)
    redirect :"categories"
  end


end




















