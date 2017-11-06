class OfferMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(offer)
    @student = offer.student
    @url  = 'http://example.com/login'
    mail(to: @student.email, subject: 'Welcome to My Awesome Site')
  end
end
