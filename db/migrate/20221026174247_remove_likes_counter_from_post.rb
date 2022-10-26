class RemoveLikesCounterFromPost < ActiveRecord::Migration[7.0]
  def change
    remove_index :posts, :likescounter
    remove_column :posts, :likescounter, :integer
  end
end
