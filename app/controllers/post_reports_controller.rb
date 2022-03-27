class PostReportsController < ApplicationController
  def create
    @post_report = PostReport.new(post_report_params)
    @post_report.save!
  end

  def destroy
    @post_report.destroy
    redirect_to root_path
  end

  def post_report_params
    params.require(:post_report).permit(:message, :post_id, :user_id)
  end
end
