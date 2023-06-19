class AvatarsController < ApplicationController
  def index
    session[:image] = params[:image] if params[:image].present?
    @image = session[:image] || "default_image.jpg"
  end
end
