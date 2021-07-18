class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user

  def self.allPending
    where(delivered_at: nil)
  end

  def self.total(order_id)
    sum = 0
    OrderItem.where(order_id: order_id).each do |item|
      sum = sum + item.qty * item.menu_item_price
    end
    sum
  end
end
