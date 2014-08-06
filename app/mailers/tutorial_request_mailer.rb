class TutorialRequestMailer < ActionMailer::Base
    default from: "youngtutors1230@gmail.com"

  def tutorial_request_confirmation(user)
  	mail(:to => user.email, :subject => "Your tutorial request has been posted!")
  end

end
