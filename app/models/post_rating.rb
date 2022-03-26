class PostRating < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  belongs_to :users, class_name: 'User', foreign_key: 'user_id'

  validates :rating, presence: true
end
