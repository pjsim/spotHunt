class EnquiryMailer < ActionMailer::Base
  default from: "eric.hercog@gmail.com"

  def enquiry_email(enquirer)
  	@enquirer = enquirer

  end
end
