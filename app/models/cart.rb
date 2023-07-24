class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy # destroys the corresponding line_items as well

  def add_product(product) # @returns the updated quantity of the cart item, or creates a new cart
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
      current_item.price = product.price
    end
    current_item
  end

  def total_price
    line_items.sum { |item| item.total_price }
  end
end
