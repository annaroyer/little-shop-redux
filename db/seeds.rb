require 'csv'
require './app/models/merchant'

class Seeds
  CSV.foreach("./data/merchants.csv", headers: true, header_converters: :symbol) do |row|
    Merchant.create!(row.to_hash)
  end
end
