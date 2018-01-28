require 'csv'
require './app/models/merchant'
require './app/models/category'
require './app/models/item'

class Seed
  OPTIONS = {headers: true, header_converters: :symbol}

  CSV.foreach("./db/csv/merchants.csv", OPTIONS) do |row|
    Merchant.create!(row.to_hash)
  end

  CSV.foreach("./db/csv/items.csv", OPTIONS) do |row|
    require 'pry'; binding.pry
    Item.create!( title:       row[:name],
                  description: row[:description],
                  unit_price:  row[:unit_price],
                  image:       "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg",
                  merchant_id: row[:merchant_id]
                )
  end

  CSV.foreach("./db/csv/category.csv", OPTIONS) do |row|
    Category.create!(row.to_hash)
  end
end
