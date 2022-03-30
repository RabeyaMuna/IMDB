class Post < ApplicationRecord
  include ContentType
  include Rails.application.routes.url_helpers

  has_one_attached :poster
  has_many :comments
  has_many :post_ratings
  has_many :post_reports
  has_many :cast_crews, dependent: :destroy

  has_many_attached :images, dependent: :destroy
  has_one_attached :trailer, dependent: :destroy

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  accepts_nested_attributes_for :cast_crews, allow_destroy: true, reject_if: :all_blank

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

  private

  def generate_post_url
    update_attribute(:link, "#{Global.backend_server.base_url}/#{post_path(self)}")
  end
end
