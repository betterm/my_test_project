class Order < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :items
  validates :first_course, :main_course, :drink, presence: true



  private


  def order_params
  params.require(:order).permit(:user, :user_id)
  end

end
