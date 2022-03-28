class Comment < ApplicationRecord
  has_many :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy

  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  has_many :reports

  validates :comment, presence: true
end
