class Category < ActiveRecord::Base
  validates_presence_of :name, uniqueness: true
  # validates :name, uniqueness: true
end