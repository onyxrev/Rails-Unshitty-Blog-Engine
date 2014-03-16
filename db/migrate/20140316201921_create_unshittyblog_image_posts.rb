class CreateUnshittyblogImagePosts < ActiveRecord::Migration
  def change
    create_table :unshittyblog_image_posts do |t|
      t.integer :image_id
      t.integer :post_id
      t.boolean :is_primary

      t.timestamps
    end
  end
end
