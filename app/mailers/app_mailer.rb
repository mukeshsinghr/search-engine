class AppMailer < ActionMailer::Base
  #  include ApiHelper::EmailLib
 
  self.default :from => 'Idiotona <mukeshsinghr@gmail.com>'

  # This method send an email to Multiple user at a time.
  def send_email(to_email_list, from_user_email, subject, body)
    mail(:to => to_email_list, :from => from_user_email, :subject => subject, :body=> body)
    puts "mail has been sent to #{to_email_list}"
  end
end


