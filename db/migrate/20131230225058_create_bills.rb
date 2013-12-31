class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.float :multiplier
      t.date :month

      t.timestamps
    end

    add_index :bills, :month, :unique
  end
end
