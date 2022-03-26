class Post < ApplicationRecord
  include ContentType

  has_many :comments, dependent: :destroy
  has_many :post_ratings, dependent: :destroy
  has_many :post_reports, dependent: :destroy
  has_many :cast_crews, dependent: :destroy

  has_many_attached :images, dependent: :destroy
  has_many_attached :videos, dependent: :destroy

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  accepts_nested_attributes_for :cast_crews, allow_destroy: true, reject_if: :all_blank

  CATEGORY = { movie: 0, music_video: 1, short_film: 2 }.freeze
  enum category: CATEGORY

  validates :name, :release_date, :category, presence: true
  validates :images,
            content_type: IMAGE_TYPE,
            size: { less_than_or_equal_to: 5.megabytes, message: 'must be within 5MB in size' }

  validates :videos,
            content_type: {
              in: VIDEO_TYPE,
              message: "formats supported are #{VIDEO_TYPE.join(', ')}."
            },
            size: { less_than_or_equal_to: 500.megabytes, message: 'must be within 500MB in size' }
end
