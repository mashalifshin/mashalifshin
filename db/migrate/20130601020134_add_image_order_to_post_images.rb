class AddImageOrderToPostImages < ActiveRecord::Migration
  def change
    add_column :post_images, :image_order, :integer
  end
end
