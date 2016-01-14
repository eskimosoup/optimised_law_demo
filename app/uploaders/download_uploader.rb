class DownloadUploader < Optimadmin::ImageUploader

  version :index do
    process resize_to_fill: [257, 257]
  end

  version :homepage do
    process resize_to_fill: [180, 210]
  end

  version :show do
    process resize_to_fill: [233, 303]
  end
end
