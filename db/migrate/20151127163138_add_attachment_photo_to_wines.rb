class AddAttachmentPhotoToWines < ActiveRecord::Migration
  def self.up
    change_table :wines do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :wines, :photo
  end
end
