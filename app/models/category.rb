class Category < ActiveRecord::Base
  validates_presence_of :name
  has_many :items

  def self.most_expensive_item
    Category.all.max_by do |category|
      category.items.maximum(:unit_price)
    end
  end

  def self.least_expensive_item
    Category.all.min_by do |category|
      category.items.minimum(:unit_price)
    end
  end

  def average_item_price
    items.average(:price).to_f.round(2)
  end
end
