class Admin::HomesController < ApplicationController
    
  def top
   @order = Order.all
   @cart_items = CartItem.all
  end
end
