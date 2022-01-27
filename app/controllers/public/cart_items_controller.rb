class Public::CartItemsController < ApplicationController
 
 before_action :authenticate_customer!

    
 def index
  @cart_items = current_customer.cart_items
 end
    
 def update
  @cart_items = CartItem.find(params[:id])
  @cart_items.update(cart_item_params)
  redirect_to cart_items_path
 end

 def destroy
  cart_items = CartItem.find(params[:id])
  cart_items.destroy
  flash[:notice]="Book was successfully destroyed."
  redirect_to cart_items_path
 end
 
 def destroy_all
  current_customer.cart_items.destroy_all
  redirect_to cart_items_path
 end
 
 def create
  @cart_items = current_customer.cart_items.new(cart_item_params)
  @cart_items.save
  redirect_to cart_items_path

 end

 private
  def cart_item_params
   params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
end