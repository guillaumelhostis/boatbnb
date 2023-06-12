class RemoveTestFromCruises < ActiveRecord::Migration[7.0]
  def change
    remove_column :cruises, :test, :string
  end
end
