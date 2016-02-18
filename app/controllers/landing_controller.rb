class LandingController < ApplicationController
  include CmsRequest

  def welcome
    cms_request action_name
  end

end
