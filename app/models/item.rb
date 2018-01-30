class Item < ActiveRecord::Base
  validates_presence_of :title, :description, :price, :image
  before_validation :set_price
  belongs_to :merchant
  belongs_to :category

  def set_price
    self.price = (unit_price / 100).to_f.round(2) if unit_price
  end

  def self.average_price
    average(:price).to_f.round(2)
  end

  def self.most_recently_created
    order("created_at DESC").first
  end

  def self.oldest
    order("created_at DESC").last
  end
end
