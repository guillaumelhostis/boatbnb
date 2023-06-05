class AddColmunsToCruises < ActiveRecord::Migration[7.0]
  def change
    add_column :cruises, :capacity, :integer
  end
end
