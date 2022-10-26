class AddCommentsCounterRefToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :comments, null: false, foreign_key: true
  end
end
