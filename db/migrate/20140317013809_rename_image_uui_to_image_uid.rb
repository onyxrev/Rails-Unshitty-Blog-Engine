class RenameImageUuiToImageUid < ActiveRecord::Migration
  def change
    rename_column :blogocalypse_images, :image_uui, :image_uid
  end
end
