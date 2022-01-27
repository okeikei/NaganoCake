class RemoveCostomerIdFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :costomer_id, :integer
  end
end
