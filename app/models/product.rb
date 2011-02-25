class Product < ActiveRecord::Base
  default_scope :order => 'title'
  
  # validation
  validates :title, :description, :image_url, :presence => true # :title, :description, :image_url has to be present/not empty!
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01} # validates that the price contains a valid number and is not below a price of 0.01
  validates :title, :uniqueness => true # validates that the :title is unique
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png)$}i, # a regular expression that only allows image format with gif, jpg or png
    :message => 'must be a URL for GIF, JPG or PNG image.' # a message that is shown if the file isnt one of the above file formats
  }
  
end
