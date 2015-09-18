FactoryGirl.define do
  factory :video do
    sequence(:name) {|n| "Video #{ n }" }
    youtube_embed_code '<iframe width="600" height="300" src="https://www.youtube.com/embed/Xz-UvQYAmbg" frameborder="0" allowfullscreen></iframe>'
    display true
    video_category
  end

end
