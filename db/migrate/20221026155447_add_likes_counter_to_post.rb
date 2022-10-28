class AddLikesCounterToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :likescounter, :integer
    add_index :posts, :likescounter
  end
end
