class AddCommentsCounterToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :commentscounter, :integer
    add_index :posts, :commentscounter
  end
end
