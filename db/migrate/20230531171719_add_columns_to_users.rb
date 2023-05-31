class AddColumnsToUsers < ActiveRecord::Migration[7.0]

  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :date_of_birth, :integer
    add_column :users, :address, :string
    add_column :users, :postcode, :integer
    add_column :users, :city, :string
    add_column :users, :sailing_experience, :text
    add_column :users, :description, :text
    add_column :users, :rate, :float
  end
end
