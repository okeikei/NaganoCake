class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  
  has_many :orders
  
  has_many :cart_items
  
  has_many :addresses
  
  def customer_infomation
    self.postal_code + self.address + self.last_name + self.first_name
    #データ型変更の場合はto_iやto_sを使用
  end
  
  def full_name
    self.last_name + self.first_name
    #データ型変更の場合はto_iやto_sを使用
  end
  
  def full_address
     postal_code + address
  end
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  
end
