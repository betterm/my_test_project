class Item < ActiveRecord::Base
  validates :name, :price,:description, :a_day_of_week, :category, presence: true
  validates :price, numericality: {greater_than: 0}
  validates :name, length: { minimum: 2 }, uniqueness: true
  validates :description, length: {minimum: 2}

  has_and_belongs_to_many :orders


  def name_with_price
    "#{self.name} - $#{self.price}"
  end

  def total
    items[0].price + items[1].price + items[2].price
  end

end
