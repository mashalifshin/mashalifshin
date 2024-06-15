class AddDateToPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :date, :date
  end
end
