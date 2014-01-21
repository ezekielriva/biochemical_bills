class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.belongs_to :order
      t.belongs_to :bio_practice
      t.timestamps
    end

    add_index :order_lines, [:order_id, :bio_practice_id], unique:true
  end
end
