class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :increase_like_counter

  def increase_like_counter
    post.increment!(:likescounter)
  end
end
