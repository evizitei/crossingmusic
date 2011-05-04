class ContactMessagesController < ApplicationController
  def create
    @contact_message = ContactMessage.create!(params[:contact_message])
    InternalMailer.contact_us_message(@contact_message).deliver
  end
end
