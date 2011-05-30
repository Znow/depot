class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy # When order is finished, destroy the line_item, the actual order
  validates :name, :address, :email, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES

  PAYMENT_TYPES = ["Check", "Credit Card", "Purchase Order"]
end
