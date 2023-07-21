class StoreController < ApplicationController
  include CurrentSessionCart
  before_action :set_cart
  def index
    @products = Product.order(:title)
  end

end
