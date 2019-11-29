class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 20},
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, presence: true, format: /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/
  validates :password, format: {with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i}
  validates :password_confirmation, length: {minimum: 8, maximum: 32}
  validates :intro, length:{ maximum:255 }
  validates :live, length:{ maximum: 50 } 
  
  has_secure_password
  # password_digestをハッシュ化する。bcryptというGemが必要。
  
end
