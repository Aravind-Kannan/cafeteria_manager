class CartItem < ApplicationRecord
  belongs_to :user

  def self.total
    sum = 0
    all.each do |item|
      sum = sum + item.qty * item.menu_item_price
    end
    sum
  end
end
