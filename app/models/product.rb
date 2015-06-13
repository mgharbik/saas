class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :client, presence: true
end
