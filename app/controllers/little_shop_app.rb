class LittleShopApp < Sinatra::Base
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/merchants' do
    @merchants = Merchant.where("name LIKE ?", "%#{params[:name]}%")
    if @merchants.empty?
      erb :"missing"
    else
      erb :"merchants/index"
    end
  end

  get '/merchants/new' do
    erb :"merchants/new"
  end

  get '/merchants-dashboard' do
    @merchants = Merchant.all
    erb :"merchants/dashboard"
  end

  post '/merchants' do
    merchant = Merchant.create(params[:merchant])
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
    @categories = Category.where("name LIKE ?", "%#{params[:name]}%")
    if @categories.empty?
      erb :"missing"
    else
      erb :"categories/index"
    end
  end

  get '/categories/new' do
    erb :"categories/new"
  end

  get '/categories/:id/edit' do |id|
    @category = Category.find(params[:id])
    erb :"categories/edit"
  end

  get '/categories/:id' do
    @category = Category.find(params[:id])
    erb :"categories/show"
  end

  post '/categories' do
    category = Category.create(params[:category])
    redirect :"categories/#{category.id}"
  end

  put '/categories/:id' do |id|
    Category.update(id.to_i, params[:category])
    redirect :"categories/#{id}"
  end

  get '/categories-dashboard' do
    @categories = Category.all
    erb :"categories/dashboard"
  end

  delete '/categories/:id' do |id|
    Category.destroy(id.to_i)
    redirect :"categories"
  end

  get '/items-dashboard' do
    @items = Item.all
    erb :"items/dashboard"
  end

  get '/items' do
    @items = Item.where("title LIKE ?", "%#{params[:title]}%")
    if @items.empty?
      erb :"missing"
    else
      erb :"items/index"
    end
  end

  get '/items/new' do
    @merchants = Merchant.alphabetized
    @categories = Category.alphabetized
    erb :"/items/new"
  end

  post '/items' do
    item = Item.create(params[:item])
    redirect :"items/#{item.id}"
  end

  get '/items/:id/edit' do
    @merchants = Merchant.alphabetized
    @categories = Category.alphabetized
    @item = Item.find(params[:id])
    erb :"items/edit"
  end

  put '/items/:id' do |id|
    Item.update(id.to_i, params[:item])
    redirect :"items/#{id}"
  end

  delete '/items/:id' do |id|
    Item.destroy(id.to_i)
    redirect :"items"
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    erb :"items/show"
  end

  get '/api/v1/items/:id' do |id|
    item = Item.find(id)
    item.to_json
  end

  not_found do
    status 404
    erb :"missing"
  end

end
