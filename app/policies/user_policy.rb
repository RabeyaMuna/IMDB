class User
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def index?
    return true if user.admin
  end

  def update?
    return true if current_user.present?
  end

  def destroy?
    return true if user.present? && (user.admin || current_user )
  end
end
