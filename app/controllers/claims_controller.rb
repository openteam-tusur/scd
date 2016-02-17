class ClaimsController < ApplicationController

  def new
    @claim = Claim.new
  end

  def create
    @claim = Claim.new(params[:claim])
    if verify_recaptcha(:model => @claim) && @claim.save
      if I18n.locale == :ru
        redirect_to ru_registratsiya_done_path
      else
        redirect_to en_registration_done_path
      end
    else
      render :new
    end
  end

end
