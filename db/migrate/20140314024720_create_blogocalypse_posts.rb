class CreateBlogocalypsePosts < ActiveRecord::Migration
  def change
    create_table :blogocalypse_posts do |t|
      t.string :title
      t.text :body
      t.datetime :published_at

      t.timestamps
    end
  end
end
