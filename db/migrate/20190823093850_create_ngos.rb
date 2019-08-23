class CreateNgos < ActiveRecord::Migration[6.0]
  def change
    create_table :ngos do |t|
      t.string :name
      t.string :address
      t.string :number
      t.float :longitude
      t.float :latitude
      t.string :email
      t.text :services
      t.text :about
      t.boolean :status
      t.string :link
      t.string :accepted_documents

      t.timestamps
    end
  end
end
