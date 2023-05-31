class CreateCruises < ActiveRecord::Migration[7.0]
  def change
    create_table :cruises do |t|
      t.string :title
      t.string :boat_model
      t.string :itinerary
      t.date :starting_date
      t.date :ending_date
      t.text :description
      t.integer :boat_age
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
