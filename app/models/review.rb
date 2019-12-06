class Review < ApplicationRecord
  
  validates:user_id ,presence:true
  validates:shop_id ,presence:true
  validates:review ,presence:true
  
  belongs_to :users
  belongs_to :shops
end
