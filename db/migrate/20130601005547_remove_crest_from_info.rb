class RemoveCrestFromInfo < ActiveRecord::Migration[4.2]
  def up
    remove_column :infos, :crest
  end

  def down
    add_column :infos, :crest, :string
  end
end
