class Category < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  has_many :items

  def self.sort_by_item_price
    select("categories.*, items.*")
      .joins(:items)
      .order("unit_price DESC")
  end

  def self.most_expensive_item
    sort_by_item_price.first
  end

  def self.least_expensive_item
    sort_by_item_price.last
  end

  def average_item_price
    (items.average(:unit_price).to_f / 100).round(2)
  end
end
