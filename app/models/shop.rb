class Shop < ApplicationRecord
  
  validates:name, presence:true
  validates:genre, presence:true
  validates:info, presence:true,length:{ maximum:255 }
  validates:tell, presence:true,format: {with:/\A\d{9,10}\z/}
  #ハイフンなし 9桁(電話番号)
  mount_uploader :image, ImageUploader
  
  has_many :reviews
end
