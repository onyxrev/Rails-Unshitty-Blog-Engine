class CreateUnshittyblogImages < ActiveRecord::Migration
  def change
    create_table :unshittyblog_images do |t|
      t.string :image_uui
      t.string :title
      t.string :alt

      t.timestamps
    end
  end
end
