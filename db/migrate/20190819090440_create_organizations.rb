class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :email
      t.integer :number
      t.string :address
      t.string :service
      t.text :about

      t.timestamps
    end
  end
end
