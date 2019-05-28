class AddSetToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :set, :integer
  end
end
