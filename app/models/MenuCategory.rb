class MenuCategory < ApplicationRecord
  has_many :menu_items

  def self.allCategories
    pluck(:name)
  end

  def self.allActive
    where("active = ?", true)
  end
end
