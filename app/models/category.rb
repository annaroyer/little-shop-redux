class Category < ActiveRecord::Base
  validates_presence_of :name, true
  # validates :name, uniqueness: true
end