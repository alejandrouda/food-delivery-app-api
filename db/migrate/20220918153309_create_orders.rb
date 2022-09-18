class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :orderID
      t.integer :time
      t.string :address
      t.string :status

      t.timestamps
    end
  end
end
