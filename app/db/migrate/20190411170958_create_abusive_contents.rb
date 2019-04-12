class CreateAbusiveContents < ActiveRecord::Migration[5.2]
  def change
    create_table :abusive_contents do |t|
      t.references :user
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
