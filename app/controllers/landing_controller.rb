class LandingController < ApplicationController
  include CmsRequest

  def welcome
    @claim = Claim.new
    cms_request action_name
  end

end
