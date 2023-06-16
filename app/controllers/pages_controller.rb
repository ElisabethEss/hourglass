class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    # @image = current_user.profile.avatars.first
  end
end
