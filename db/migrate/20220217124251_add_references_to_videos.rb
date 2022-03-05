class AddReferencesToVideos < ActiveRecord::Migration[6.1]
  def change
    add_reference :videos, :course, null: true, foreign_key: true
    add_reference :videos, :user, null: true, foreign_key: true
  end
end
