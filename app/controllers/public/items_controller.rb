class Public::ItemsController < ApplicationController
    
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_items = CartItem.new
  end
  
  private
  def item_params
   params.require(:item).permit(:name, :image, :introduction, :price)
  end

end
