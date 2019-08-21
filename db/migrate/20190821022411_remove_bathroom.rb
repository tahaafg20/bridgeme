class RemoveBathroom < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :bath_room
  end
end
