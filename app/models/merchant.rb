class Merchant < ActiveRecord::Base
  validates_presence_of :name
  has_many :items

def self.most_items
  select("merchants.*, count(items) AS count_by_merchant_id")
    .joins(:items)
    .group(:merchant_id, :id)
    .order("count_by_merchant_id DESC")
    .first
end

  def self.highest_priced_item
    select("merchants.*, items.*")
      .joins(:items)
      .order("price DESC")
      .first
  end

  def total_price_of_items
    items.sum(:price)
  end

  def highest_priced_item
    items.order("price DESC").first
  end
end
