class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :screen_name, :nickname
  end
end
