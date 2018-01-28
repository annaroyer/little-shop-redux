class Item < ActiveRecord::Base
  validates_presence_of :title, :description, :price, :image
  before_validation :set_price
  belongs_to :merchant
  belongs_to :category

  def set_price
    self.price = (unit_price / 100).round(2) if unit_price
  end
end
