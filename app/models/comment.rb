class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def increase_like_counter
    post.increment!(:commentscounter)
  end
end
