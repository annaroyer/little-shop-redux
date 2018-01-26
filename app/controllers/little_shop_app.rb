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

  get '/items' do
    @items = Item.all
    erb :"/items/index"
  end

  get '/items/new' do
    erb :"/items/new"
  end

  post '/items' do
    item = Item.create(params[:item])
    redirect :"/items/#{item.id}"
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    erb :"/items/edit"
  end

  put '/items/:id' do |id|
    Item.update(id.to_i, params[:item])
    redirect :"/items/#{id}"
  end

  delete '/items/:id' do |id|
    Item.destroy(id.to_i)
    redirect :"/items"
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    erb :"/items/show"
  end
end
