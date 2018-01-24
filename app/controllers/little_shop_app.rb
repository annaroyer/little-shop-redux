class LittleShopApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/merchants/index' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  get '/merchants/index/:id' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/show"
  end

end
