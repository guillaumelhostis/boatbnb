class AddColumnToCruises < ActiveRecord::Migration[7.0]
  def change
    add_column :cruises, :test, :string
  end
end
