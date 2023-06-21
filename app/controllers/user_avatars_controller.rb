class UserAvatarsController < ApplicationController
  def create
    UserAvatar.where(profile: current_user.profile).destroy_all
    avatar = UserAvatar.create(
      avatar_id: params[:avatar_id],
      profile: current_user.profile       # or however you retrieve the current user
    )
    @current_avatar = avatar
    redirect_to avatars_path           # just a suggestion
  end
end
