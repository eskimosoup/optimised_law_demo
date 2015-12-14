class DownloadUploader < Optimadmin::ImageUploader

  version :index do
    process resize_to_fill: [257, 257]
  end

  version :homepage do
    process resize_to_fill: [290, 193]
  end
end
