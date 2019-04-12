class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user , :default => 1 
      t.string :title
      t.string :description
      t.string :city
      t.boolean :status

      t.timestamps
    end
  end
end
