class PostPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == post.user
  end

  def destroy?
    return true if user.present? && post.present? && (user == post.user || user.admin)
  end

  private

  def post
    record
  end
end
