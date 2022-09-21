class CreateOrderCables < ActiveRecord::Migration[7.0]
  def change
    create_table :order_cables do |t|
      t.string :content
      t.references :order_dispatcher, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
