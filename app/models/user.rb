class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 20}
  validates :email, presence: true, format: /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/
  validates :password, length: {minimum: 6}, on: :update, allow_blank: true
  validates :password_confirmation, length: {minimum: 6}, on: :update, allow_blank: true
  validates :intro, length:{ maximum:255 }
  validates :live, length:{ maximum: 50 } 
  
  has_secure_password
  # format: {with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i}
  # password_digestをハッシュ化する。bcryptというGemが必要。
  # ,confirmation: true, on: :create
  has_many :reviews
  
end
