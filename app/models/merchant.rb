class Merchant < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many :items

  def self.how_many_items?
    items.count
  end

  def self.total_price_of_items
    items.sum("unit_price")
  end
end
