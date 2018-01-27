require 'csv'
require './app/models/merchant'
require './app/models/item'
require './app/models/category'



class Seed

  OPTIONS = {headers: true, header_converters: :symbol}

  def self.start
    seed_merchants
    seed_categories
    seed_items
  end

  def self.seed_merchants
    CSV.foreach("./db/csv/merchants.csv", OPTIONS) do |row|
      Merchant.create!(row.to_hash)
    end
  end

  def self.seed_items
    CSV.foreach("./db/csv/items.csv", headers: true, header_converters: :symbol) do |row|

      Item.create!( title: row[:name],
                    description: row[:description],
                    unit_price: row[:unit_price],
                    image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg"
                 )
    end
  end

  def self.seed_categories
    CSV.foreach("./db/csv/category.csv", OPTIONS) do |row|
      Category.create!(row.to_hash)
    end
  end
end

Seed.start