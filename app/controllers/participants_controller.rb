class ParticipantsController < ApplicationController
  def index
    render layout: false
    @participants = Claim.all
  end
end
