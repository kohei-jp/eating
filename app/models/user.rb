class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 15}
  validates :email, presence: true, format: /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/
  validates :password, format: {with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i}
  validates :password_confirmation, length: {minimum: 8, maximum: 32}
  
  has_secure_password
  
end
