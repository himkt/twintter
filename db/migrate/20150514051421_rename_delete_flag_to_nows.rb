class RenameDeleteFlagToNows < ActiveRecord::Migration
  def up
    rename_column :nows, :deleteflag, :deleted
    #   呪文     :テーブル名, :旧カラム名, :新カラム名
  end

  def down
    rename_column :nows, :deleted, :deleteflag
    #   呪文     :テーブル名, :新カラム名, :旧カラム名
  end
end
