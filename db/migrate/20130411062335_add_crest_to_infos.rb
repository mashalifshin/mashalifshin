class AddCrestToInfos < ActiveRecord::Migration[4.2]
  def change
    add_column :infos, :crest, :string
  end
end
