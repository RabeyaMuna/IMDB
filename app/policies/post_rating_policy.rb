class PostRatingPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def create?
    return true if user.present?
  end

  def update?
    return true if user.present? && post_rating.present? && user == post_rating.user
  end

  private

  def post_rating
    record
  end
end
