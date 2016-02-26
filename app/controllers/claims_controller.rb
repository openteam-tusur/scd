class ClaimsController < ApplicationController
  layout false
  def new
    @claim = Claim.new
    render :new
  end

  def create
    @claim = Claim.new(params[:claim])
    if verify_recaptcha(model: @claim) && @claim.save
      render partial: 'claim'
    else
      render :new
    end
  end

end
