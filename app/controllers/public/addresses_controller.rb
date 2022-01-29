class Public::AddressesController < ApplicationController
  

  def create
    @address = current_customer.addresses.new(address_params)
    @address.save!
    redirect_to addresses_path
  end

  def index
    @addresses = current_customer.addresses
    @address_new = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end
  
  def destroy
    address = Address.find(params[:id])
    address.destroy
    flash[:notice]="Book was successfully destroyed."
    redirect_to addresses_path
  end
  
  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
  
end