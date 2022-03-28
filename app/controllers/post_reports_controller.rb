class PostReportsController < ApplicationController
  def create
    @post = Post.find_by(id: params[:id])
    @post_report = @post.post_reports.new(post_report_params)
    if @post_report.save!
      PostReportMailer.with(post_report: @post_report).new_post_report_mail.deliver_later

      flash[:success] = "Thank you for your report! We'll get contact you soon!"
      redirect_to post_path
    else
      flash.now[:error] = "Your report had some errors. Please check the form and resubmit."
    end
  end

  def destroy
    @post_report.destroy
    redirect_to root_path
  end

  def post_report_params
    params.require(:post_report).permit(:message, :post_id, :user_id)
  end
end
