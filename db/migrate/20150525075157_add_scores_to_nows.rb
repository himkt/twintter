class AddScoresToNows < ActiveRecord::Migration
  def change
    add_column :nows, :score, :float
  end
end
