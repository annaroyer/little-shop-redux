class LittleShopApp < Sinatra::Base
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/merchants' do
    @merchants = Merchant.where("name LIKE ?", "%#{params[:name]}%")
    erb :"merchants/index"
  end

  get '/merchants/new' do
    erb :"merchants/new"
  end

  get '/merchants-dashboard' do
    @merchants = Merchant.all
    @with_most_items = Merchant.most_items
    @with_highest_price = Merchant.highest_priced_item
    erb :"merchants/dashboard"
  end

  post '/merchants' do
    Merchant.create(params[:merchant])
    redirect :"merchants"
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
    erb :"categories/index"
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
    Category.create(params[:category])
    redirect :"categories"
  end

  put '/categories/:id' do |id|
    Category.update(id.to_i, params[:category])
    redirect :"categories/#{id}"
  end

  get '/categories-dashboard' do
    @categories = Category.all
    erb :"/categories/dashboard"
  end

  delete '/categories/:id' do |id|
    Category.destroy(id.to_i)
    redirect :"categories"
  end

  get '/items-dashboard' do
    @most_recently_created = Item.most_recently_created
    @oldest = Item.oldest
    erb :"items/dashboard"
  end

  get '/items' do
    @items = Item.where("title LIKE ?", "%#{params[:title]}%")
    erb :"/items/index"
  end

  get '/items/new' do
    @merchants = Merchant.all
    @categories = Category.all
    erb :"/items/new"
  end

  post '/items' do
    Item.create(params[:item])
    redirect :"/items"
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

  get '/api/v1/items/:id' do |id|
    item = Item.find(id)
    item.to_json
  end

end
