class Admin::VideosController < ApplicationController

  # TODO: Make sure this is covered by authorization

  def index
    @videos = Video.all
  end

  def create
    video = Video.new(video_params)
    if video.save
      flash[:notice] = "Video succesfully uploaded"
    else
      flash[:error] = video.errors.messages.values[0][0]
    end
    redirect_to admin_videos_path
  end

  private

  def video_params
    params.require(:video).permit(:url, :title)
  end
end
