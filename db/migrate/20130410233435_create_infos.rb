class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :resume
      t.text :about

      t.timestamps
    end
  end
end
