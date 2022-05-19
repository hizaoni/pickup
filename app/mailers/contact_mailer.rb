class ContactMailer < ApplicationMailer

  default from: "aaa@aaa", subject: "備品発注点のお知らせ"
  def send_mail(user,message)
    @user=user
    @message=message
    mail to: user.email
  end
end
