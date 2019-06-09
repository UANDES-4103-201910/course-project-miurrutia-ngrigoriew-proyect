class AddDsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :ds, :boolean
  end
end
