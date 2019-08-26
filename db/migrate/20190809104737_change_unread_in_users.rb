class ChangeUnreadInUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :unread
    add_column :users, :unread, :integer, default: 1
  end
end
