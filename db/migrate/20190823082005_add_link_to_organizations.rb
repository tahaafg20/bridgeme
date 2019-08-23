class AddLinkToOrganizations < ActiveRecord::Migration[6.0]
  def change
    add_column :communities, :link, :string
    add_column :educations, :link, :string
  end
end
