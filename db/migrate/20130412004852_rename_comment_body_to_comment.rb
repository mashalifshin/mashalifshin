class RenameCommentBodyToComment < ActiveRecord::Migration[4.2]
    def change
      rename_column :comments, :body, :comment
    end
end
