class LineItem < ActiveRecord::Base
  belongs_to :product #rows in lineitem is children of product and cart
  belongs_to :cart
end
