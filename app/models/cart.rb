class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy #can have many associated line_items entry's, :destroy is dependent on the carts existance
end
