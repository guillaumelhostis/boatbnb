class AddColumnsToCruises < ActiveRecord::Migration[7.0]
  def change
    add_column :cruises, :from, :string
    add_column :cruises, :to, :string
  end
end
