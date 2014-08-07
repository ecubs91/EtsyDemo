<<<<<<< HEAD
class RegistrationsController < Devise::RegistrationsController

  def create
    super
    p "----------------------------------------"
    WelcomeMailer.registration_confirmation(current_user).deliver
    p "----------------------------------------"
  end

end
=======
class RegistrationsController < Devise::RegistrationsController

  def create 
    WelcomeMailer.registration_confirmation(resource.email).deliver
  end

end
>>>>>>> db27003e0f6e06f73c999d68302fd425345614fd
