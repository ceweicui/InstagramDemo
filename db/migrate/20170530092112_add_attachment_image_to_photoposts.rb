class AddAttachmentImageToPhotoposts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :photoposts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :photoposts, :image
  end
end
