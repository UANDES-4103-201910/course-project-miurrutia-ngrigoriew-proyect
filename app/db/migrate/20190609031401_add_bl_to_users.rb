class AddBlToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bl, :boolean
  end
end
