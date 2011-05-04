class InternalMailer < ActionMailer::Base
  default :from => "no-reply@crossingsongs.com", :to => "david@crossingsongs.com"
  
  def contact_us_message(contact_message)
    @message = contact_message.body
    mail(:subject => contact_message.subject)
  end
end
