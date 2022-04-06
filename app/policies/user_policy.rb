class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      end
    end
  end
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def update?
    return true if current_user.present?
  end

  def destroy?
    return true if user.present? && (user.admin || current_user )
  end
end
