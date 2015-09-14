class ServiceUploader < Optimadmin::ImageUploader

  version :index do
    process resize_to_fill: [283, 145]
  end

  version :show do
    process resize_to_fill: [165, 135]
  end

end
