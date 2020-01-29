class LineItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart
  belongs_to :order

  # LOGIC
  def total_price
    quantity * item.price
  end
end
