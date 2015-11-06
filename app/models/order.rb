class Order < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :items

  def order_price
    @order_price = self.first_course.price + self.main_course.price + self.drink.price
  end
end
