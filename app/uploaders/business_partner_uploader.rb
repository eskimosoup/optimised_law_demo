class BusinessPartnerUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fit: [188, 98]
  end
end
