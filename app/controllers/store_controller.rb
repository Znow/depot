class StoreController < ApplicationController
  
  def index
    @products = Product.all # Gets all the products from Products table and adds them to instance variable @products
    @cart = current_cart
  end

end
