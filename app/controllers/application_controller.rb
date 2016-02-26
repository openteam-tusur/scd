class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      redirect_to main_app.root_path
    else
      redirect_to Settings['profile.sign_in_url']
    end
  end

end
