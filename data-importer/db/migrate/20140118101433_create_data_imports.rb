class CreateDataImports < ActiveRecord::Migration
  def change
    create_table :data_imports do |t|
      t.string :filename
      t.integer :rows
      t.integer :purchases
      t.decimal :total_revenue
    end
  end
end
