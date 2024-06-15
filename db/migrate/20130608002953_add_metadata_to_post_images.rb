class AddMetadataToPostImages < ActiveRecord::Migration[4.2]
  def change
    add_column :post_images, :date, :date
    add_column :post_images, :author, :string
    add_column :post_images, :info, :text
  end
end
