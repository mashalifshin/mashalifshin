class AddNameToPostImages < ActiveRecord::Migration
  def change
    add_column :post_images, :name, :string
  end
end
