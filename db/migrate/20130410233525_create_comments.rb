class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :name
      t.text :body
      t.boolean :approved

      t.timestamps
    end
  end
end
