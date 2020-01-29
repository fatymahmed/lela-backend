class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items
  has_many :line_lists, dependent: :destroy
  has_many :products, through: :line_lists
  # LOGIC
  def sub_total
    sum = 0
    line_items.each do |line_item|
      sum += line_item.total_price
    end
    line_lists.each do |line_list|
      sum += line_list.total_price
    end
    sum
  end
end
