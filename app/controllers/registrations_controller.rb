class RegistrationsController < Devise::RegistrationsController

  def create 
    WelcomeMailer.registration_confirmation(resource.email).deliver
  end

end