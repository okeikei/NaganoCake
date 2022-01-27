class Admin::CustomersController < ApplicationController
    
  def index
    @customers = Customer.all
    if params[:is_deleted] == true
      @customers.is_deleted = "有効"
      
    elsif params[:is_deleted] == false
      @customers.is_deleted = "退会"
    end
  end
  
  def show
    @customer = Customer.find(params[:id])
    if params[:is_deleted] == true
      @customers.is_deleted = "有効"
      
    elsif params[:is_deleted] == false
      @customers.is_deleted = "退会"
    end
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customers_path
  end
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end

end