class ClaimsController < ApplicationController
  layout false
  def new
    @claim = Claim.new
    render :new
  end

  def create
    @claim = Claim.new(params[:claim])
    if @claim.save #&& #verify_recaptcha(model: @claim)
      render partial: 'claim'
    else
      puts @claim.errors.inspect
      render :new
    end
  end

end
