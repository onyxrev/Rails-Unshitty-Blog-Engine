class CreateBlogocalypseImagePosts < ActiveRecord::Migration
  def change
    create_table :blogocalypse_image_posts do |t|
      t.integer :image_id
      t.integer :post_id
      t.boolean :is_primary

      t.timestamps
    end
  end
end
