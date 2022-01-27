class Admin::OrdersController < ApplicationController
    
 def show
  @order = Order.find(params[:id])
  @order_details = @order.order_details
 end
 
 def update
  @order = Order.find(params[:id])
  @order.update!(order_params)
  @order_details = @order.order_details
  if params[:order][:status] == "製作中"
   @order_details.each do |order_detail|
    order_detail.making_status = "製作中"
    order_detail.save
  end
 end
  redirect_to request.referer
 end
 
 private
   def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment, :shipping_cost, :status, :product_status)
   end
end



