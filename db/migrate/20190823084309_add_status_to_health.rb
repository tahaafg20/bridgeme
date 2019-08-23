class AddStatusToHealth < ActiveRecord::Migration[6.0]
  def change
    add_column :healths, :status, :boolean
  end
end
