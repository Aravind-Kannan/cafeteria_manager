class User < ApplicationRecord
  has_many :orders
  has_many :cart_items
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
end
