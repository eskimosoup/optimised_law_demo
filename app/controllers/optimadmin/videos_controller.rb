module Optimadmin
  class VideosController < Optimadmin::ApplicationController
    before_action :set_video, only: [:show, :edit, :update, :destroy]

    edit_images_for Video, [[:image, { index: ['fill', 316, 164], show: ['fill', 165, 135], full_widget: ['fill', 386, 193], activity_stream: ['fill', 592, 296] }]]

    def index
      @videos = Optimadmin::BaseCollectionPresenter.new(collection: Video.where('name ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::VideoPresenter)
    end

    def show
    end

    def new
      @video = Video.new
    end

    def edit
    end

    def create
      @video = Video.new(video_params)
      if @video.save
        redirect_to videos_url, notice: 'Video was successfully created.'
      else
        render :new
      end
    end

    def update
      if @video.update(video_params)
        redirect_to videos_url, notice: 'Video was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @video.destroy
      redirect_to videos_url, notice: 'Video was successfully destroyed.'
    end

  private


    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:name, :image, :image_cache, :remote_image_url, :remove_image, :youtube_embed_code, :display, :video_category_id, :summary, service_ids: [])
    end
  end
end
