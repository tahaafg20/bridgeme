class ChangeNumberToString < ActiveRecord::Migration[6.0]
  def change
    remove_column :organizations, :number
    add_column :organizations, :number, :string
  end
end
