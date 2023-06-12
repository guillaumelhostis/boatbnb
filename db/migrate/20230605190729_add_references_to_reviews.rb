class AddReferencesToReviews < ActiveRecord::Migration[7.0]
  def change
    change_table(:reviews) do |t|
    t.references :creator_user, foreign_key: { to_table: 'users' }
    t.references :target_user, foreign_key: { to_table: 'users' }
  end
  end
end
