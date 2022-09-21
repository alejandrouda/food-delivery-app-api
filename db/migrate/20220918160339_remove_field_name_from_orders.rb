class RemoveFieldNameFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :orderID, :string
  end
end
