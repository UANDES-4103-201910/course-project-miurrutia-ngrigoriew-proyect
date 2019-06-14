class AddAttachmentFileToPosts < ActiveRecord::Migration[5.2]
  def self.up
    change_table :posts do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :posts, :file
  end
end
