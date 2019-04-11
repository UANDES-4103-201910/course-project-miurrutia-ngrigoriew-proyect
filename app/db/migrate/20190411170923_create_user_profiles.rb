class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.references, :user
      t.string, :bio
      t.string, :personal_picture
      t.string, :city
      t.string, :country
      t.string :gps

      t.timestamps
    end
  end
end
