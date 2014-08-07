class WelcomeMailer < ActionMailer::Base
  default from: "harrylee1230@gmail.com"

  def registration_confirmation(user)
    @user = user
  	mail(:to => @user.email, :subject => "Thank you for signing up with Young Tutors")
  end

end
