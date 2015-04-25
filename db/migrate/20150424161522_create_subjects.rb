class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :kcode
      t.string :kname
      t.float :unit
      t.string :grade
      t.string :semester
      t.string :time
      t.string :location
      t.text :lecturer
      t.text :summary
      t.text :note
      t.string :credit
      t.text :condition
      t.string :alternative

      t.timestamps null: false
    end
  end
end
