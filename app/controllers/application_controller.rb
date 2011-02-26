class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private #makes method only available to controllers
  
    def current_cart #new method
      Cart.find(session[:cart_id]) #find a session with a cart id
    rescue ActiveRecord::RecordNotFound #if cant find, do a RecordNotFound
      cart = Cart.create #create a new cart
      session[:cart_id] = cart.id #define the session :cart_id to cart.id
      cart #create a new cart object
    end
  end
  
