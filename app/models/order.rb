class Order < ActiveRecord::Base
  has_many :items
  belong_to :user
  has_and_belongs_to_many :items

  private
  params.require(:order).permit(:user, :user_id)
end
