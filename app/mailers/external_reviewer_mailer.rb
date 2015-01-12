class ExternalReviewerMailer < ActionMailer::Base
  default from: "from@example.com", to: 'test@localhost'

  def welcome_mail(user)
    @user = user
    mail(to: @user.email, subject: 'This is a spam')
  end
end
