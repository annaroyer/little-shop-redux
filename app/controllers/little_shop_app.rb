class LittleShopApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/merchants/index' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  get '/merchants/index/new' do
    erb :"merchants/new"
  end

  post '/merchants/index' do
    merchant = Merchant.create(params[:merchant])
    redirect :"merchants/index/#{merchant.id}"
  end

  get '/merchants/index/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/edit"
  end

  get '/merchants/index/:id' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/show"
  end

  put '/merchants/index/:id' do |id|
    Merchant.update(id.to_i, params[:merchant])
    redirect :"merchants/index"
  end

end
