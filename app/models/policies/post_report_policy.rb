class PostReportPolicy
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

  def destroy?
    return true if user.present? && post_report.present? && (user == post_report.user || user.admin)
  end

  private

  def post_report_report
    record
  end
end
