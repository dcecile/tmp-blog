class AddAttachmentImageToArticles < ActiveRecord::Migration[5.1]
  def change
    change_table :articles do |t|
      t.attachment :image
    end
  end
end
