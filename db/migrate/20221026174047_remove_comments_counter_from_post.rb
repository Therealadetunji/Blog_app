class RemoveCommentsCounterFromPost < ActiveRecord::Migration[7.0]
  def change
    remove_index :posts, :commentscounter
    remove_column :posts, :commentscounter, :integer
  end
end
