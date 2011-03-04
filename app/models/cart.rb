class Cart < ActiveRecord::Base
  #can have many associated line_items entry's, :destroy is dependent on the carts existance
  has_many :line_items, :dependent => :destroy 
  
  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(:product_id => product_id)
    end
    
    current_item
  end
  
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
  
  
  # method: total_items to define how many items there is in the cart object
  def total_items
    line_items.sum(:quantity) # sum of the quantity of the current line_item
  end
  
end
