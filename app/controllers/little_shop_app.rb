class LittleShopApp < Sinatra::Base

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

  post '/merchants/new' do
    merchant = Merchant.create(params[:merchant])
    redirect :"merchants/#{merchant.id}"
  end

  post '/merchants/show' do
    @merchant = Merchant.find_by(params[:merchants])
    erb :"merchants/show"
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/show"
  end
end
