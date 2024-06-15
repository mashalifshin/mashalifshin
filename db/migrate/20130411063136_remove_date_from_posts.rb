class RemoveDateFromPosts < ActiveRecord::Migration[4.2]
  def up
    remove_column :posts, :date
  end

  def down
    add_column :posts, :date, :datetime
  end
end
