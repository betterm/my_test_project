class Item < ActiveRecord::Base
  validates :name, :price,:description, presence: true
  validates :price, numericality: {greater_than: 0}
  validates :name, length: { minimum: 2 }, uniqueness: true
  validates :description, length: {minimum: 10}
  has_and_belongs_to_many :orders
end
