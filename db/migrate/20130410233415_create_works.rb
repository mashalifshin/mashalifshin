class CreateWorks < ActiveRecord::Migration[4.2]
  def change
    create_table :works do |t|
      t.string :title
      t.text :description
      t.date :date
      t.boolean :live
      t.string :image

      t.timestamps
    end
  end
end
