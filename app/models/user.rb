class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable

  include ContentType
  include ValidEmailRegex

  has_one_attached :avatar
  has_many :posts
  has_many :post_ratings
  has_many :comments, dependent: :destroy
  has_many :post_reports, through: :posts
 
  ROLES = { admin: 0, verified_user: 1, user: 2 }.freeze
  enum role: ROLES

  validates :avatar,
            content_type: IMAGE_TYPE,
            size: { less_than_or_equal_to: 5.megabytes, message: 'must be within 5MB in size' }
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { in: 6..20 }
  validates :name, :email, presence: true
end
