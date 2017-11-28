class OfferMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def encrypt(str)
    for pos in 0...str.length
      str[pos]=(str[pos].ord+3).chr
    end
    return str
  end
  def welcome_email(offer)
    @student = offer.student
    @encryptNetID = encrypt('taobupt')
    @encryptPosition = encrypt('grader')
    @url  = 'https://csce606-ta-system.herokuapp.com'
    mail(to: @student.email, subject: 'Welcome to TAMU TA Application System')
  end
end
