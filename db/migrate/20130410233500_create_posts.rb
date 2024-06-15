class CreatePosts < ActiveRecord::Migration[4.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.datetime :date
      t.text :body

      t.timestamps
    end
  end
end
