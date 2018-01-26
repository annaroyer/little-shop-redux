require 'csv'
require './app/models/merchant'
require './app/models/category'


class Seed

  OPTIONS = {headers: true, header_converters: :symbol}

  def self.start
    seed_merchants
    seed_categories
  end

  def self.seed_merchants
    CSV.foreach("./db/csv/merchants.csv", OPTIONS) do |row|
      Merchant.create!(row.to_hash)
    end
  end

  def self.seed_categories
    CSV.foreach("./db/csv/category.csv", OPTIONS) do |row|
      Category.create!(row.to_hash)
    end
  end

end

Seed.start