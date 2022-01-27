class Item < ApplicationRecord
    
  attachment :image
  has_many :cart_items
  has_many :order_details
  
  
  
  enum is_active: { 販売中: true, 販売停止中: false}
  
  def with_tax_price
    (price * 1.1).floor
  end
  
  def shipping_cost
   "800"
  end
  
end
