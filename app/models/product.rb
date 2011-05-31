class Product < ActiveRecord::Base
  default_scope :order => 'title'
  has_many :line_items # a product can have many line_items
  has_many :orders, :through => :line_items # a product can have many line_items that belongs to many orders
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  # validation
  validates :title, :description, :image_url, :presence => true # :title, :description, :image_url has to be present/not empty!
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01} # validates that the price contains a valid number and is not below a price of 0.01
  validates :title, :uniqueness => true # validates that the :title is unique
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png)$}i, # a regular expression that only allows image format with gif, jpg or png
    :message => 'must be a URL for GIF, JPG or PNG image.' # a message that is shown if the file isnt one of the above file formats
  }
  
  private
    # ensure that there are no line_items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.count.zero? #check if line_items is zero
        return true 
      else
        errors.add(:base, 'Line Items present') #if it is, return "Line Items present
        return false
      end
    end
  
end
