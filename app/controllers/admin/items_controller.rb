class Admin::ItemsController < ApplicationController
    
  def new
    @item = Item.new
    @genre = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def index
    @items = Item.all
    if params[:is_active] == true
      @items.is_active = "販売中"
      
    elsif params[:is_active] == false
      @items.is_active = "販売停止中"
    end
  end

  def show
    @item = Item.find(params[:id])
    if params[:is_active] == true
      @items.is_active = "販売中"
    
    elsif params[:is_active] == false
      @items.is_active = "販売停止中"
    end
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_items_path
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_active)
  end
  
end
