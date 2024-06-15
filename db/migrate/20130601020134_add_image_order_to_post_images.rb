class AddImageOrderToPostImages < ActiveRecord::Migration[4.2]
  def change
    add_column :post_images, :image_order, :integer
  end
end
