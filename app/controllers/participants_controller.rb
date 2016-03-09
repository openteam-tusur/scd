class ParticipantsController < ApplicationController
  def index
    @participants = Claim.all
  end
end
