class OfficeUploader < Optimadmin::ImageUploader

  version :index do
    process resize_to_fill: [316, 164]
  end

  version :show do
    process resize_to_fill: [165, 135]
  end

end
