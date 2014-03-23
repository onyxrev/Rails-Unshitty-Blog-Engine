class RemoveAltAndTitleFromBlogocalypseImage < ActiveRecord::Migration
  def change
    remove_column :blogocalypse_images, :alt
    remove_column :blogocalypse_images, :title
  end
end
