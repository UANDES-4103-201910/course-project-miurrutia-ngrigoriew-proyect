class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user
      t.string :title
      t.string :description
      t.boolean :state

      t.timestamps
    end
  end
end
