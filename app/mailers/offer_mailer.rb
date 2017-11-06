class OfferMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(offer)
    @user = offer.student
    @url  = 'http://example.com/login'
    mail(to: "taobupt@tamu.edu", subject: 'Welcome to My Awesome Site')
  end
end
