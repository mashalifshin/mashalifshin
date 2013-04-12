class RenameCommentBodyToComment < ActiveRecord::Migration
    def change
      rename_column :comments, :body, :comment
    end
end
