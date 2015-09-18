FactoryGirl.define do
  factory :video do
    sequence(:name) {|n| "Video #{ n }" }
    youtube_embed_code '<iframe width="600" height="300" src="https://www.youtube.com/embed/Xz-UvQYAmbg" frameborder="0" allowfullscreen></iframe>'
    display true
    video_category
    trait :with_image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end
    factory :video_with_image, traits: [:with_image]
  end

end
