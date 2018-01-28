class Item < ActiveRecord::Base
  validates_presence_of :title, :description, :price, :image
  before_validation :set_price
  belongs_to :merchant
  belongs_to :category

  def set_price
    self.price = (unit_price / 100).to_f.round(2) if unit_price
  end

  def self.total_item_count
    count
  end

  def self.average_item_price
    average(:unit_price).to_f.round(2)
  end

  # def self.most_recent_item
    
  # end

  # def self.oldest_item
    
  # end


end

