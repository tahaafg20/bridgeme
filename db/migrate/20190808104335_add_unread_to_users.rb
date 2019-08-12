class AddUnreadToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :unread, :boolean, default: true
  end
end
