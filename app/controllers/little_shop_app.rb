class LittleShopApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/merchants/index' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

end
