class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :increase_post_counter
  
  private 
  
  def increase_post_counter
    author.increment!(:postcounter)
  end

  def most_recent_comment
    comments.order(created_at: DESC).limit(5)
  end
end
