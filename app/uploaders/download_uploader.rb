class DownloadUploader < Optimadmin::ImageUploader

  version :index do
    process resize_to_fill: [386, 150]
  end
end
