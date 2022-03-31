class Post < ApplicationRecord
  include ContentType
  include Rails.application.routes.url_helpers

  has_one_attached :poster, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_ratings, dependent: :destroy
  has_many :post_reports, dependent: :destroy

  has_many_attached :images, dependent: :destroy
  has_one_attached :trailer, dependent: :destroy

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  validates :name, :release_date, presence: true
  validates :poster,
            content_type: IMAGE_TYPE,
            size: { less_than_or_equal_to: 5.megabytes, message: 'must be within 5MB in size' }

  validates :trailer,
            content_type: {
              in: VIDEO_TYPE,
              message: "formats supported are #{VIDEO_TYPE.join(', ')}."
            },
            size: { less_than_or_equal_to: 500.megabytes, message: 'must be within 500MB in size' }
  after_create :generate_post_url

  before_save :calculate_average_rating

  private

  def generate_post_url
    update_attribute(:link, "#{Global.backend_server.base_url}/#{post_path(self)}")
  end

  def blank_star
    5 - rating.to_i
  end

  def calculate_average_rating
    if  self.post_ratings.present?
      self.score = self.post_ratings.sum(:rating)/self.post_ratings.count
    end
  end
end
