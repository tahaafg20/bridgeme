class AddAddressToEducation < ActiveRecord::Migration[6.0]
  def change
    add_column :educations, :address, :string
  end
end
