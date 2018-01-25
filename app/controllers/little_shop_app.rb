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

  post '/merchants/index/new' do
    merchant = Merchant.create(params[:merchant])
    redirect :"merchants/index/#{merchant.id}"
  end

  post '/merchants/index/show' do
    @merchant = Merchant.find_by(params[:merchants])
    erb :"merchants/show"
  end

  get '/merchants/index/:id' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/show"
  end
end
