class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :word
      t.float :value

      t.timestamps null: false
    end
  end
end
