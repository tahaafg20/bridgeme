class AddAccDToHealth < ActiveRecord::Migration[6.0]
  def change
    add_column :healths, :accepted_documents, :string
  end
end
