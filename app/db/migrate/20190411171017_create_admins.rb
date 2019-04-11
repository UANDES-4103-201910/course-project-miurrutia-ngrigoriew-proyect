class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string, :name
      t.string, :lastname
      t.string, :email
      t.string, :password
      t.string :geofence

      t.timestamps
    end
  end
end
