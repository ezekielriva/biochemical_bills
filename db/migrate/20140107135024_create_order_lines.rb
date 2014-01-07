class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.belongs_to :order
      t.belongs_to :bio_practice
      t.timestamps
    end
  end
end
