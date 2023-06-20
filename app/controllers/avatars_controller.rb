class AvatarsController < ApplicationController
  def index
    @profile = current_user.profile
    @avatar = @profile.avatar&.name
  end
end
