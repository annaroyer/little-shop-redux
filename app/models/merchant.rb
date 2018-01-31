class Merchant < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many :items

  def self.most_items
    select("merchants.*, count(items) AS count_by_merchant_id")
      .joins(:items)
      .group(:id)
      .order("count_by_merchant_id")
      .last
  end

  def total_price_of_items
    items.total_price
  end

  def self.highest_priced_item
    joins(:items).order("unit_price").last
  end

  def self.alphabetized
    order(:name)
  end
end
