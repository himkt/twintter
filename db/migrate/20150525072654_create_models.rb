class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :value
      t.float :sale_data

      t.timestamps null: false
    end
  end
end
