class Item < ActiveRecord::Base
  validates_presence_of :title, :description, :unit_price, :image
  belongs_to :merchant
  belongs_to :category

  def price
    (unit_price / 100).to_f.round(2)
  end

  def self.average_price
    (average(:unit_price) / 100).round(2)
  end

  def self.most_recently_created
    order("created_at DESC").first
  end

  def self.oldest
    order("created_at DESC").last
  end

  def self.total_price
    (sum(:unit_price) / 100).round(2)
  end
end
