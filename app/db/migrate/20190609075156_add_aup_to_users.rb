class AddAupToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :aup, :boolean
  end
end
