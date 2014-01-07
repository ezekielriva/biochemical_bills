class CreateBioPractices < ActiveRecord::Migration
  def change
    create_table :bio_practices do |t|
      t.string :name
      t.float :ub

      t.timestamps
    end
  end
end
