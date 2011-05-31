class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ "Check", "Credit Card", "Purchase Order" ]

  has_many :line_items, :dependent => :destroy # When order is finished, destroy the line_item, the actual order
  validates :name, :address, :email, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES


  def add_line_items_from_cart(cart) # Add the items thats in the cart to a new order
    cart.line_items.each do |item| # Get the cart's line_items , each do an item
      item.cart_id = nil # we set the item to nil, so it wont dissappear when we destroy the cart
      line_items << item # then add the item to the order
    end
  end
end
