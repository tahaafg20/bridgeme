class AddRefToOrgs < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :health, foreign_key: true
    add_reference :posts, :education, foreign_key: true
    add_reference :posts, :community, foreign_key: true
    add_reference :posts, :ngo, foreign_key: true
  end
end
