class AddPostIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :postid, :integer
    add_index :comments, :postid
  end
end
