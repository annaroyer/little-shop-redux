class Merchant < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many :items

  def self.most_items
    where("items_count >= ?", set_most_items_count)
  end

  def self.set_most_items_count
    select("merchants.*, count(items) AS count_by_merchant_id")
      .joins(:items)
      .group(:id)
      .order("count_by_merchant_id")
      .last.count_by_merchant_id
  end

  def self.highest_priced_item
      joins(:items)
      .order("price DESC")
      .first
  end

  def total_price_of_items
    items.sum(:price)
  end
end
