class AddPriceToCruise < ActiveRecord::Migration[7.0]
  def change
    add_column :cruises, :price, :integer
  end
end
