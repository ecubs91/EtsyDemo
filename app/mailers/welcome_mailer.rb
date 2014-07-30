class WelcomeMailer < ActionMailer::Base
  default from: "harrylee1230@gmail.com"

  def registration_confirmation(user)
  	mail :to ==> user, :subject ==> "Thank you for signing up with Young Tutors"
  end

end
