class AddCrestToInfos < ActiveRecord::Migration
  def change
    add_column :infos, :crest, :string
  end
end
