require 'csv'
require './app/models/merchant'

class Seeds

  def merchants
    CSV.foreach("./data/merchants.csv", headers: true, header_converters: :symbol) do |row|
      Merchant.create!(merchant_id: row[:id], name: row[:name], merchant_created_at: row[:created_at], merchant_updated_at: row[:updated_at])
    end
  end
end
