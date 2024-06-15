class AddLiveToPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :live, :boolean, :default => false
  end
end
