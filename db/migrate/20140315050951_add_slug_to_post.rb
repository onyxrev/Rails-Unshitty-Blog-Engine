class AddSlugToPost < ActiveRecord::Migration
  def change
    add_column :blogocalypse_posts, :slug, :string
    add_index :blogocalypse_posts, :slug, unique: true
  end
end
