class CreateCommunities < ActiveRecord::Migration[6.0]
  def change
    create_table :communities do |t|
      t.string :name
      t.string :email
      t.string :number
      t.string :country
      t.text :services
      t.text :about
      t.boolean :status
      t.string :address
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
