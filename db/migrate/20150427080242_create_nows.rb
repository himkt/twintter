class CreateNows < ActiveRecord::Migration
  def change
    create_table :nows do |t|
      t.string :subject_kcode
      t.text :text

      t.timestamps null: false
    end
  end
end
