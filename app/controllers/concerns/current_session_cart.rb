module CurrentSessionCart
  private
  # @returns corresponding cart.id
  # if nil, will create a new Cart 
  def set_cart
    @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
