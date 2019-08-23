class AddRefrencesToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :ngos, :user, foreign_key: true
    add_reference :posts, :user, foreign_key: true
    add_reference :communities, :user, foreign_key: true
    add_reference :healths, :user, foreign_key: true
    add_reference :educations, :user, foreign_key: true
  end
end
