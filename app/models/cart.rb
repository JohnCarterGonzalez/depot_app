class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy # destroy a cart, destroy the corresponding line_items as well

  # @returns the updated quantity of the cart item, 
  # or creates a new cart
  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
    end
  end

  def total_price
    line_items.sum { |item| item.total_price }
  end

end
