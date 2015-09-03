class ServiceCategoryUploader < Optimadmin::ImageUploader

  version :index do
    process resize_to_fill: [223, 223]
  end

  version :show do
    process resize_to_fill: [218, 135]
  end

end