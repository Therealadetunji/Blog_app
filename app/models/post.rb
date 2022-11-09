class Post < ApplicationRecord
  # validates :title, presence: true, length: { maximum: 250 }
  # validates :commentscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :likescounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :increase_post_counter

  def increase_post_counter
    author.increment!(:postcounter)
  end

  def most_recent_comment
    comments.order(created_at: DESC).limit(5)
  end
end
