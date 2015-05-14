class ChangeDeletedtoNows < ActiveRecord::Migration
  def change
    change_column(:nows, :deleted, :integer, :default=>0)
  end
end
