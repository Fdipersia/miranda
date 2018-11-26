class VideosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_videos, only: [:show]

  def index
    @videos = policy_scope(Video)
    if @videos
      if params["difficulty"]
        @videos = policy_scope(Video.where(difficulty: params["difficulty"]))
      else
        @videos
      end
    else
      redirect_to subscriptions_new_path
    end
  end

  def show
    @questions = @video.questions
    @answer = Answer.new
    @points
  end

  def set_videos
    @video = Video.find(params[:id])
    authorize @video
  end
end
