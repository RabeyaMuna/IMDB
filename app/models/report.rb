class Report < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :comment, class_name: 'Comment', foreign_key: 'comment_id'

  validates :body, presence: true
end
