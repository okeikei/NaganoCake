class RemoveCostomerIdFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :costomer_id, :integer
  end
end
