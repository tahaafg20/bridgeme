class RemoveColumnFromRooms < ActiveRecord::Migration[6.0]
  def change

    remove_column :rooms, :home_type, :string

    remove_column :rooms, :bed_room, :string
  end
end
