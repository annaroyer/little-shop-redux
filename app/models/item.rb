class Item < ActiveRecord::Base
  validates_presence_of :title, :description, :unit_price, :image
  belongs_to :merchant
  belongs_to :category

  def price
    (self.unit_price / 100).round(2)
  end
end
