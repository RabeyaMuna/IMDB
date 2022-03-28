class PostReportMailer < ApplicationMailer
  def new_post_report_mail
    @post = params[:post]

    mail(to: 'admin@gmail.com', subject: 'You got a Report from user regarding content!')
  end
end
