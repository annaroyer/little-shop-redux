class Merchant < ActiveRecord::Base
  validates_presence_of :name
  has_many :items

  def self.total_price_of_items
    joins(:items).sum(:price)
  end
end
