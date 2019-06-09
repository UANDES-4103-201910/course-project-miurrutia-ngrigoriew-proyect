class AddTosToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tos, :boolean
  end
end
