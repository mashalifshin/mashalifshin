class CreatePostImages < ActiveRecord::Migration
  def change
    create_table :post_images do |t|
      t.string :image
      t.integer :post_id

      t.timestamps
    end
  end
end
