class DownloadPresenter < BasePresenter
  presents :download
  delegate :title, to: :download

  def category_name
    download.download_category.name if download.download_category.present?
  end

  def download_button
    h.link_to 'Download', download.file.url, class: 'service-download-read-more'
  end

  def download_link
    h.link_to title, download.file.url
  end

  def summary
    h.simple_format download.summary
  end
end
