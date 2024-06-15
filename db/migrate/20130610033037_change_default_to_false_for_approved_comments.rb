class ChangeDefaultToFalseForApprovedComments < ActiveRecord::Migration[4.2]
  def up
    change_column :comments, :approved, :boolean, :default => false
  end

  def down
    change_column :comments, :approved, :boolean
  end
end
