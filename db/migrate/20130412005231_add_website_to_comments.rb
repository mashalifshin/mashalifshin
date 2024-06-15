class AddWebsiteToComments < ActiveRecord::Migration[4.2]
  def change
    add_column :comments, :website, :string
  end
end
