class VideoPresenter < BasePresenter
  presents :video

  delegate :name, to: :video

  def youtube_embed
    h.raw video.youtube_embed_code
  end
end