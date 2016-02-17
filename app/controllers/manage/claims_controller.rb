class Manage::ClaimsController < Manage::ApplicationController

  def index
    @claims = ClaimsSearcher.new(params).results
  end

  def show
    @claim = Claim.find(params[:id])
  end

end
