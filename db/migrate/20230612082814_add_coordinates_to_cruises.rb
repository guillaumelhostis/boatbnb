class AddCoordinatesToCruises < ActiveRecord::Migration[7.0]
  def change
    add_column :cruises, :latitude, :float
    add_column :cruises, :longitude, :float
  end
end
