class EventUploader < Optimadmin::ImageUploader

  version :index do
    process resize_to_fill: [316, 164]
  end

  version :show do
    process resize_to_fill: [218, 135]
  end

  version :activity_stream do
    process resize_to_fill: [199, 155]
  end

end
