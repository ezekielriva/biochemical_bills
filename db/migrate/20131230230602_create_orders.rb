class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :bill, index:true
      t.string :patient_name
      t.integer :patient_no, index:true
      t.timestamps
    end
  end
end
