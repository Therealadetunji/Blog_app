class RemovePostIdFromLike < ActiveRecord::Migration[7.0]
  def change
    remove_index :likes, :postid
    remove_column :likes, :postid, :integer
  end
end
