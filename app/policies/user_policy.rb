class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  attr_reader :user

  def index?
    user.admin?
  end

  def update?
    return true if current_user.present?
  end

  def destroy?
    return true if user.present? && (user.admin? || user == current_user )
  end
end
