require 'csv'
require './app/models/merchant'
require './app/models/item'


class Seeds
  CSV.foreach("./db/csv/merchants.csv", headers: true, header_converters: :symbol) do |row|
    Merchant.create!(row.to_hash)
  end

  CSV.foreach("./db/csv/items.csv", headers: true, header_converters: :symbol) do |row|

    Item.create!( title: row[:name],
                  description: row[:description],
                  unit_price: row[:unit_price],
                  image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg"
                )
  end
end
