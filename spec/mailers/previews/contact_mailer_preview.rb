# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def send_mail
    @user = User.new(name: "ひろし", email: "aaa@aaa")
    @message = "〇〇が発注点になりました。"
    ContactMailer.send_mail(@user, @message)
  end

end
