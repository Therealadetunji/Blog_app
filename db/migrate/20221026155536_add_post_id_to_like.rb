class AddPostIdToLike < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :postid, :integer
    add_index :likes, :postid
  end
end
