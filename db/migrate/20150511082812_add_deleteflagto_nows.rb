class AddDeleteflagtoNows < ActiveRecord::Migration
  def change
    add_column :nows,:deleteflag,:boolean
  end
end
