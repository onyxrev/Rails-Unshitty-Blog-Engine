class AddSlugToPost < ActiveRecord::Migration
  def change
    add_column :unshittyblog_posts, :slug, :string
    add_index :unshittyblog_posts, :slug, unique: true
  end
end
