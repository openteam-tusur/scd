class ClaimsController < ApplicationController
  layout false
  def new
    @claim = Claim.new
    render :new
  end

  def create
    @claim = Claim.new claim_params
    if verify_recaptcha(model: @claim) && @claim.save
      render partial: 'claim'
    else
      render :new
    end
  end

  private

  def claim_params
    parameters = params[:claim]
    if parameters[:already_in_tomsk] == '1'
      [:departure_transport, :departure_time,
       :arrival_transport, :arrival_time
      ].each {|k| parameters.delete k}
    else
      [:departure_time, :arrival_time].each do |key|
        puts parameters[key]
        parameters[key] = DateTime.strptime parameters[key], Claim.time_format
      end
    end
    parameters
  end

end
