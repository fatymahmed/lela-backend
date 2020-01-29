class LineList < ApplicationRecord
  belongs_to :list
  belongs_to :cart
  belongs_to :order

  # LOGIC
  def total_price
    quantity * list.price
  end
end
