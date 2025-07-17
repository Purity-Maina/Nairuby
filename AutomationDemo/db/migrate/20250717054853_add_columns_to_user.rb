class AddColumnsToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :email, :string
    add_column :users, :age, :integer
    add_column :users, :location, :string
  end
end
