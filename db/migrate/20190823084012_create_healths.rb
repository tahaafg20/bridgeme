class CreateHealths < ActiveRecord::Migration[6.0]
  def change
    create_table :healths do |t|
      t.string :name
      t.string :number
      t.string :link
      t.string :email
      t.text :services
      t.text :about
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
