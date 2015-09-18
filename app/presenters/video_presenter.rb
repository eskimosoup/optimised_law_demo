class VideoPresenter < BasePresenter
  presents :video

  delegate :name, to: :video

  def youtube_embed
    h.raw video.youtube_embed_code
  end

  def video_category_name
    video.video_category.name
  end

  def summary
    h.raw video.summary
  end
end
