class PostReportMailer < ApplicationMailer
  def new_post_report_email(post, post_report, sender_mail)
    @post_url = post.link
    @post_reporter_name = post_report.user.name
    @reason = post_report.message

    mail(from: sender_mail, to: 'admin@gmail.com', subject: "You got a Report from user regarding content!")
  end
end
