class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def increase_post_counter
    author.increment!(:posts_counter)
  end

  def most_recent_comment
    comments.order(created_at: DESC).limit(5)
  end
end
