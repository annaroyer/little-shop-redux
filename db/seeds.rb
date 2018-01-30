require 'csv'
require './app/models/merchant'
require './app/models/category'
require './app/models/item'

class Seed
  OPTIONS = {headers: true, header_converters: :symbol}
  images = ["https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg",
            "https://img.brainjet.com/filter:scale/slides/2/9/2/0/2/2/2920220617/60ff2c82de98be41cda8324c659cb0800d1df69d.jpeg?mw=615",
            "https://iso.500px.com/wp-content/uploads/2014/03/51260092-1170-440x440.jpeg",
            "http://2.bp.blogspot.com/-7dDx6i8kngY/T2trRZBLzEI/AAAAAAAAEjQ/sZYULyYTXXk/s1600/cute-baby-animals-in-cup-019.jpg"
            ]
  count = 0
  
  CSV.foreach("./db/csv/merchants.csv", OPTIONS) do |row|
    Merchant.create!(row.to_hash)
  end

  CSV.foreach("./db/csv/items.csv", OPTIONS) do |row|
    count += 1
    Item.create!( title:       row[:name],
                  description: row[:description],
                  unit_price:  row[:unit_price],
                  image:       images[count % 4],
                  merchant_id: row[:merchant_id]
                )
  end

  CSV.foreach("./db/csv/category.csv", OPTIONS) do |row|
    Category.create!(row.to_hash)
  end
end
