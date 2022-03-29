class PostReportsController < ApplicationController
  before_action :find_post

  def create
    @post_report = @post.post_reports.new(post_report_params)
    if @post_report.save!

      PostReportMailer.new_post_report_email(@post, @post_report, current_user.email).deliver_later
      flash[:success] = "Thank you for your report! We'll get contact you soon!"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    @post_report = @post.post_reports.find(params[:id])
    @post_report.destroy!
    redirect_to root_path
  end

  def post_report_params
    params.require(:post_report).permit(:message, :post_id).merge(user_id: current_user.id)
  end

  def find_post
    @post = Post.find_by(id: params[:post_id])
  end
end
