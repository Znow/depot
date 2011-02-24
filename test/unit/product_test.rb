require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  # Test: Product attributes must not be empty
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.erros[:price].any?
    assert product.erros[:image_url].any?
  end
  
  # Test: Product price must be positive number
  test "product price must be positive" do
    product = Product.new( #creates a new instance of Product and sets :title, :description and :image_url
      :title => "My Book Title",
      :description => "yyy",
      :image_url => "zzz.jpg"
    )
    product.price = -1 #sets the product price to -1
    assert product.invalid? #assumes product is invalid
    assert_equal "must be greater than or equal to 0.01",
      product.errors[:price].join('; ')
      
    product.price = 0
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
      product.errors[:price].join('; ')
    
    product.price = 1
    assert product.valid?
  end
  
  # defines a new method: new_product with attr: image_url
  def new_product(image_url)
    Product.new(
      :title => "My Book Title",
      :description => "yyy",
      :image_url => image_url
    )
  end
  
  # Test: Testing if Product validates image_url is .gif, .jpg, .png
  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif } # %w creates an "array" without ' and ,
    
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    
    ok.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't be invalid"
    end
    
    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
    
  end
end
