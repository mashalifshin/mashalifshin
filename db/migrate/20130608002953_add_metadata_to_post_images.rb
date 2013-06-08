class AddMetadataToPostImages < ActiveRecord::Migration
  def change
    add_column :post_images, :date, :date
    add_column :post_images, :author, :string
    add_column :post_images, :info, :text
  end
end
