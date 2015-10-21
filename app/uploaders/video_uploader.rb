class VideoUploader < Optimadmin::ImageUploader

  version :index do
    process resize_to_fill: [316, 164]
  end

  version :show do
    process resize_to_fill: [218, 135]
  end

  version :full_widget do
    process resize_to_fill: [386, 193]
  end

  version :activity_stream do
    process resize_to_fill: [592, 296]
  end

end
