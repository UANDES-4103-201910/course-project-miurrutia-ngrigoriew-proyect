class CreateSuperadmins < ActiveRecord::Migration[5.2]
  def change
    create_table :superadmins do |t|
      t.string, :name
      t.string, :lastname
      t.string, :email
      t.string :password

      t.timestamps
    end
  end
end
