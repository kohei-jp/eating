class Shop < ApplicationRecord
  
  validates:name, presence:true
  validates:genre, presence:true
  validates:info, presence:true,length:{ maximum:255 }
  validates:tell, presence:true
  
  has_many :reviews
end
