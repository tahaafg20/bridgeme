class CreateEducations < ActiveRecord::Migration[6.0]
  def change
    create_table :educations do |t|
      t.string :name
      t.string :number
      t.string :email
      t.text :about
      t.string :accepted_documents
      t.text :services
      t.boolean :status
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
